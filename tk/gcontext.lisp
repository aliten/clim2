;; -*- mode: common-lisp; package: tk -*-
;;
;;				-[]-
;; 
;; copyright (c) 1985, 1986 Franz Inc, Alameda, CA  All rights reserved.
;; copyright (c) 1986-1991 Franz Inc, Berkeley, CA  All rights reserved.
;;
;; The software, data and information contained herein are proprietary
;; to, and comprise valuable trade secrets of, Franz, Inc.  They are
;; given in confidence by Franz, Inc. pursuant to a written license
;; agreement, and may be stored and used only in accordance with the terms
;; of such license.
;;
;; Restricted Rights Legend
;; ------------------------
;; Use, duplication, and disclosure of the software, data and information
;; contained herein by any agency, department or entity of the U.S.
;; Government are subject to restrictions of Restricted Rights for
;; Commercial Software developed at private expense as specified in FAR
;; 52.227-19 or DOD FAR Supplement 252.227-7013 (c) (1) (ii), as
;; applicable.
;;
;; $fiHeader: gcontext.lisp,v 1.7 92/03/04 16:19:12 cer Exp Locker: cer $

(in-package :tk)

(eval-when (compile load eval)
	   (defconstant *gcontext-components* 
	     '((function :int)
	       (plane-mask :unsigned-long)
	       (foreground :unsigned-long)
	       (background :unsigned-long)
	       (line-width :int)
	       (line-style :int)
	       (cap-style :int)
	       (join-style :int)
	       (fill-style :int)
	       (fill-rule :int)
	       (arc-mode :int)
	       (tile :pixmap)
	       (stipple :pixmap)
	       (ts-x-origin :int)
	       (ts-y-origin :int)
	       (font x-font)
	       (subwindow-mode :int)
	       (exposures :boolean)
	       (clip-x :int)
	       (clip-y :int)
	       (clip-mask :pixmap)
	       (dash-offset :int)
	       (dashes :char)))

	   (defconstant *gcontext-bit-mask*
	     '(function plane-mask foreground background
			line-width line-style cap-style join-style fill-style
			fill-rule tile stipple ts-x-origin ts-y-origin font subwindow-mode
			exposures clip-x clip-y clip-mask dash-offset dashes
			arc-mode)))


(eval-when (compile load eval)
	   (defun gcontext-component-to-slot-definition (x)
	     (destructuring-bind
	      (name c-type) x
	      `(,name :reader ,(intern (format nil "~A-~A" 'gcontext name)))))
  
	   (defun gcontext-component-to-writer  (x)
	     (destructuring-bind
	      (name c-type) x
	      `(defmethod (setf ,(intern (format nil "~A-~A" 'gcontext name))) 
		 (nv gc)
		 (set-gcontext-component 
		  gc 
		  ,(intern (symbol-name name) :keyword)
		  nv)
		 (setf (slot-value gc ',name) nv)))))


(defclass gcontext (display-object)
  ()
  (:metaclass standard-class-wrapping-foreign-address))
	  


(defmethod initialize-instance :after ((gcontext gcontext)
				       &key
				       foreign-address
				       drawable
				       function plane-mask foreground background
				       line-width line-style
				       cap-style join-style fill-style fill-rule 
				       arc-mode tile stipple ts-x ts-y
				       font subwindow-mode 
				       exposures clip-x clip-y
				       clip-mask clip-ordering 
				       dash-offset dashes)
  (unless foreign-address
    (setf foreign-address (x11::xcreategc display drawable 0 0)
	  (foreign-pointer-address gcontext) foreign-address
	  (slot-value gcontext 'display) (object-display drawable))
    (register-address gcontext foreign-address))
    
    ;;; Set the ones that are specified
    
  (when function (setf (gcontext-function gcontext) function))
  (when plane-mask (setf (gcontext-plane-mask gcontext) plane-mask))
  (when foreground (setf (gcontext-foreground gcontext) foreground))
  (when background (setf (gcontext-background gcontext) background))
  (when line-width (setf (gcontext-line-width gcontext) line-width))
  (when line-style (setf (gcontext-line-style gcontext) line-style))
  (when cap-style (setf (gcontext-cap-style gcontext) cap-style))
  (when join-style (setf (gcontext-join-style gcontext) join-style))
  (when fill-style (setf (gcontext-fill-style gcontext) fill-style))
  (when fill-rule (setf (gcontext-fill-rule gcontext) fill-rule))
  (when arc-mode (setf (gcontext-arc-mode gcontext) arc-mode))
  (when tile (setf (gcontext-tile gcontext) tile))
  (when stipple (setf (gcontext-stipple gcontext) stipple))
  (when ts-x (setf (gcontext-ts-x gcontext) ts-x))
  (when ts-y (setf (gcontext-ts-y gcontext) ts-y))
  (when font (setf (gcontext-font gcontext) font))
  (when subwindow-mode (setf (gcontext-subwindow-mode gcontext) subwindow-mode))
  (when exposures (setf (gcontext-exposures gcontext) exposures))
  (when clip-x (setf (gcontext-clip-x gcontext) clip-x))
  (when clip-y (setf (gcontext-clip-y gcontext) clip-y))
  (when clip-mask (setf (gcontext-clip-mask gcontext clip-ordering) clip-mask))
  (when dash-offset (setf (gcontext-dash-offset gcontext) dash-offset))
  (when dashes (setf (gcontext-dashes gcontext) dashes))
  gcontext)



(defun free-gcontext (gc)
  (x11:xfreegc 
   (object-display gc)
   gc)
  (unregister-address gc))

(defun lispify-function-name (name)
  (intern (substitute #\_ #\- (symbol-name (lispify-tk-name name)))))

(defmacro define-gc-writer (name encoder &rest args)
  `(progn
     (defmethod (setf ,(intern (format nil "~A-~A" 'gcontext name)))
	 (nv (gc gcontext))
       (let ((gc-values (x11::make-xgcvalues)))
	 (setf (,(intern (format nil "~A~A"
				 'xgcvalues-
				 name)
			 :x11)
		gc-values)
	       (,encoder nv ,@args))
	 
	 (x11:xchangegc
	  (object-display gc)
	  gc
	  ,(ash 1 (or (position name *gcontext-bit-mask*)
		      (error "Cannot find ~S in gcontext components" name)))
	  gc-values)
	 nv))))

(defmacro define-gc-reader (name decoder &rest args)
  `(defmethod ,(intern (format nil "~A-~A" 'gcontext name)) ((gc gcontext))
    (,decoder 
     (,(intern (format nil "~A~A" '_xgc-values- name) :x11)
      gc)
     ,@args)))

(defmacro define-gc-accessor (name (encoder decoder) &rest args)
  `(progn
     (define-gc-reader ,name ,decoder ,@args)
     (define-gc-writer ,name ,encoder ,@args)
     ',name))

;;; Accessors for the gc

(define-gc-accessor function (encode-function decode-function))
(define-gc-accessor plane-mask (encode-card32 decode-card32))

;(define-gc-accessor foreground (encode-pixel decode-pixel))
;(define-gc-accessor background  (encode-pixel decode-pixel))

(defmethod gcontext-foreground ((gc gcontext))
  (decode-pixel (x11::_xgc-values-foreground gc)))

(defmethod gcontext-background ((gc gcontext))
  (decode-pixel (x11::_xgc-values-background gc)))

(defmethod (setf gcontext-foreground) (nv (gc gcontext))
  (x11:xsetforeground 
   (object-display gc)
   gc
   (encode-pixel nv)))

(defmethod (setf gcontext-background) (nv (gc gcontext))
  (x11:xsetbackground 
   (object-display gc)
   gc
   (encode-pixel nv)))


(define-gc-accessor line-width  (encode-card16 decode-card16))
  
(defmethod gcontext-fill-style ((gc gcontext))
  (decode-fill-style
   (x11::_xgc-values-fill-style gc)))

(defun decode-fill-style (x)
  (nth x '(:solid :tiled :stippled :opaque-stippled)))

(defun encode-fill-style (x)
  (or (position x '(:solid :tiled :stippled :opaque-stippled))
      (error "~s is not a fill style" x)))

(defmethod (setf gcontext-fill-style) (nv (gc gcontext))
  (x11:xsetfillstyle
   (object-display gc)
   gc
   (encode-fill-style nv)))
  

(define-gc-accessor fill-rule (encode-enum decode-enum) '(:even-odd :winding))
(define-gc-accessor tile  (encode-pixmap decode-pixmap))
(define-gc-accessor stipple  (encode-pixmap decode-pixmap))

(defun encode-pixmap (x)
  x)

(define-gc-accessor ts-x-origin (encode-int16 decode-int16))
(define-gc-accessor ts-y-origin (encode-int16  decode-int16))

   
(define-gc-accessor font (encode-font decode-font))
(define-gc-accessor cap-style (encode-cap-style decode-cap-style))

(defun encode-cap-style (x)
  (or (position x '(:not-last :butt :round :projecting))
      (error "~s is not a cap style" x)))

(define-gc-accessor join-style (encode-join-style decode-join-style))

(defun encode-join-style (x)
  (or (position x '(:miter :round :bevel))
      (error "~s is not a join-style" x)))

(define-gc-accessor subwindow-mode (encode-enum decode-enum)
		  '(:clip-by-children :include-inferiors))
(define-gc-accessor exposures (encode-enum decode-enum) '(:off :on))
(define-gc-accessor clip-x (encode-int16 decode-int16))
(define-gc-accessor clip-y (encode-int16 decode-int16))

(define-gc-accessor dash-offset (encode-card16 decode-card16))
(define-gc-accessor arc-mode (encode-enum decode-enum)  '(:chord :pie-slice))

;;; 


;;; Some encoding stuff

(defconstant *boole-vector*
	     '#(#.boole-clr #.boole-and #.boole-andc2 #.boole-1
		#.boole-andc1 #.boole-2 #.boole-xor #.boole-ior
		#.boole-nor #.boole-eqv #.boole-c2 #.boole-orc2
		#.boole-c1 #.boole-orc1 #.boole-nand #.boole-set))

(defun encode-function (x) 
  (or (position x *boole-vector*)
      (error "Cannot encode gc function: ~S" x)))

(defun encode-card32 (x) x)
(defun encode-card16 (x) x)
(defun encode-enum (x y)
  (or (position x y)
      (error "cannot find ~s in ~s" x y)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun set-line-attributes (gc line-width line-style cap-style join-style)
  (x11:xsetlineattributes
   (object-display gc)
   gc
   line-width
   (encode-line-style line-style)
   (encode-cap-style cap-style)
   (encode-join-style join-style)))

(defmethod (setf gcontext-clip-mask) ((nv (eql :none)) (gc gcontext))
  (x11:xsetclipmask
   (object-display gc)
   gc
   x11::none))

(defmethod (setf gcontext-clip-mask) ((nv cons) (gc gcontext))
  (destructuring-bind
   (x y width height) nv
   (let ((r (x11:make-xrectangle)))
     (setf (x11:xrectangle-x r) x
	   (x11:xrectangle-y r) y
	   (x11:xrectangle-width r) width
	   (x11:xrectangle-height r) height)
     (x11:xsetcliprectangles
      (object-display gc)
      gc
      0					; clip-x-origin
      0					; clip-y-origin
      r
      1
      x11:unsorted))))

(defmethod (setf gcontext-clip-mask) ((nv (eql :nowhere)) (gc gcontext))
  (x11:xsetcliprectangles
   (object-display gc)
   gc
   0					; clip-x-origin
   0					; clip-y-origin
   0
   0
   x11:unsorted))

(define-gc-accessor line-style  (encode-line-style decode-style))

(defun encode-line-style (x)
  (or (position x '(:solid :dash :double-dash))
      (error "~S is not a valid line-style" x)))

(defmethod (setf gcontext-dashes) (nv (gc gcontext))
  (multiple-value-bind
      (n v)
      (encode-dashes nv)
    (x11:xsetdashes
     (object-display gc)
     gc
     0
     v
     n)
    (excl::free v)))


(defun encode-dashes (nv)
  (let (n v)
    (etypecase nv
      (list 
       (setq n (length nv))
       (setq v (excl::malloc n))
       (let ((i 0))
	 (dolist (x nv)
	   (setf (sys::memref-int v i 0 :unsigned-byte) x)
	   (incf i))))
      (vector
       (setq n (length nv))
       (setq v (excl::malloc n))
       (dotimes (i n)
	 (setf (sys::memref-int v i 0 :unsigned-byte) (aref nv i)))))
    (values n v)))
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun encode-int16 (x) x)


(defun encode-font (x) (x11:xfontstruct-fid x))



;;; This could be made more efficient by not have all the clos
;;; wrappers


(defun decode-card16 (x) x)

(defun decode-font (x) 
  (if (= x #16rffffffff)
      (error "cannot decode font")
    (let ((font (find-object-from-xid x nil)))
      (or font
	  (query-font display x)))))

(defun decode-pixmap (x) 
  (and (/= #16rffffffff x)
       (intern-object-xid
	x
	'pixmap)))

(defun decode-clip-mask (x) x)
(defun decode-enum (x y)
  (or (elt y x)
      (error "cannot find ~s in ~s" x y)))
(defun decode-card32 (x) x)
(defun decode-dashes (x) x)
(defun decode-int16 (x) x)


;;;;;;;;;;;;;;;;;;;

(defparameter *temp-gc-stack* nil)

(defmacro with-gcontext ((gc &rest options) &body body)
  (let* ((tgc (gensym))
	 setfs
	 (bits (reduce #'logior
		       (do ((r nil)
			    (o options (cddr o)))
			   ((null o) r)
			 (let ((x (gensym)))
			   (push `(let ((,x ,(cadr o)))
				    (when ,x
				      (setf (,(intern (format nil "~A~A" 'gcontext-
							      (car o)))
					     gc)
					,x)))
				 setfs))
			 (push (ash 1 
				    (position (car o)
					      *gcontext-bit-mask*
					      :test #'string=))
			       r)))))
    `(let ((,tgc (allocate-temp-gc gc)))
       (x11:xcopygc (object-display gc)
		  gc
		  ,bits
		  ,tgc)
       (unwind-protect
	   (progn ,@(nreverse setfs)
		  ,@body)
	 (x11:xcopygc (object-display gc)
		    ,tgc
		    ,bits
		    gc)
	 (deallocate-temp-gc ,tgc)))))

(defun allocate-temp-gc (gc)
  (make-instance 'gcontext 
		 :drawable (display-root-window (object-display gc))))

(defun deallocate-temp-gc (gc)
  nil)

#|
(with-gcontext (gc :function foo :font bar)
	       (print gc))
|#

(defmethod encode-pixel ((x integer))
  x)

(defun decode-pixel (x) x)
(defmethod encode-pixel ((x color))
  (allocate-color (default-colormap display 0) x))


    
   
