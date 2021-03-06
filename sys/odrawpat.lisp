;; copyright (c) 1985,1986 Franz Inc, Alameda, Ca.
;; copyright (c) 1986-2005 Franz Inc, Berkeley, CA  - All rights reserved.
;; copyright (c) 2002-2007 Franz Inc, Oakland, CA - All rights reserved.
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
;; Commercial Software developed at private expense as specified in
;; DOD FAR Supplement 52.227-7013 (c) (1) (ii), as applicable.
;;
;; $Id: odrawpat.lisp,v 2.8 2007/04/25 20:29:26 layer Exp $

(in-package :acl-clim)

(defun create-child-window (parent pretty scroll left top width height)
  (let ((winstyle (logior win:ws_clipchildren
                          win:ws_child
			  win:ws_border
			  ; win:bs_ownerdraw
			  ; win:ws_thickframe repaint prob + 2 much realestate
			  (if (or (eql scroll :both)(eql scroll :vertical))
			    win:ws_vscroll 0)
			  (if (or (eql scroll :both)(eql scroll :horizontal))
			    win:ws_hscroll 0)
			  win:ws_clipsiblings))
        (win-name (win-name *acl-port*))
        (cstr (ct:callocate (:char *) :size 256))
	(subsize (when pretty (length pretty)))
	(window nil))
    (when pretty
      (dotimes (i subsize)
        (ct:cset (:char 256) cstr ((fixnum i)) (char-int (char pretty i))))
      (setq win-name cstr))
    (setq window
	  (win:createWindow
		(clim-class *acl-port*)	   ; cl-user::clim-class ; "ClimClass"
		win-name   ; "CLIM"
		winstyle
		left top width height
		parent
		(ct:null-handle win:hmenu)
		pc::*hinst*
		*win-arg*))
    (if (or (eql scroll :both)(eql scroll :vertical))
      (win:setScrollRange window win:SB_VERT 0 100 1))
    (if (or (eql scroll :both)(eql scroll :horizontal))
      (win:setScrollRange window win:SB_HORZ 0 100 1))
    window))

(in-package :pc)

(defun hbutton-open (parent id left top width height 
		     &key (buttonstyle BS_AUTORADIOBUTTON)
		          (value nil)
			    (active nil)
			  (nobutton nil)
			  (label ""))
   (let* ((hwnd
	   (excl:with-native-string (classname "BUTTON")
	     (excl:with-native-string (windowname (nstringify label))
	       (CreateWindowEx
		0			; extended-style
		classname		; classname
		windowname		; windowname
		(logior buttonstyle
					;HBS_DOWNPICS	; special picture while pressed
					;HBS_AUTOADVANCE
					;HBS_TEXTINDENT
					; (if (not active) win:bn_disable 0)
			(if (typep label 'acl-clim::acl-pixmap) win:bs_ownerdraw 0) 
			(if nobutton HBS_NOBUTTON 0)
			WS_CHILD
			WS_BORDER
			WS_CLIPCHILDREN 
			WS_CLIPSIBLINGS) ; style
		0 0 0 0
		parent
		(let ((hmenu (ccallocate hmenu)))
		  (setf (handle-value hmenu hmenu) id)
					; (or id (next-child-id parent))
		  hmenu)
		*hinst*
		"x")))))
    (format *terminal-io* "~%use ownerdraw label ~S" label)

     (if (null-handle-p hwnd hwnd)
		 ;; failed
		 (cerror "proceed" "failed")
		 ;; else succeed if we can init the DC
		 (progn
		    (SetWindowPos hwnd (null-handle hwnd) 
		       left top width height
		       #.(ilogior SWP_NOACTIVATE SWP_NOZORDER)
		       :static)
		    #+ignore (showWindow hwnd SW_SHOW)
		    (when value
		          (win:sendmessage hwnd
					   pc::bm_setcheck
					   #+ignore pc::HBM_PRESS
					   1 0))))
     hwnd))
