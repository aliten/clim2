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
;; $fiHeader: foreign.lisp,v 1.12 92/05/22 19:26:19 cer Exp $

(in-package :tk)

;;; We have to interface to various foreign functions in the toolkit

;; 



(defclass application-context (ff:foreign-pointer)
  ((displays :initform nil :accessor application-context-displays)))

(defparameter *error-handler-function-address*
  (register-function 'toolkit-error-handler))

(defparameter *warning-handler-function-address*
  (register-function 'toolkit-warning-handler))

(defmethod initialize-instance :after ((c application-context) &key context)
  (let ((context (or context (xt_create_application_context))))
    (setf (foreign-pointer-address c) context)
    (xt_app_set_error_handler 
     context
     *error-handler-function-address*)
    (xt_app_set_warning_handler
     context
     *warning-handler-function-address*)))

(defun create-application-context ()
  (make-instance 'application-context))

(defun open-display (&key (context (create-application-context))
			  (host nil)
			  (application-name "clim")
			  (application-class "Clim")
			  (options 0)
			  (num-options 0)
			  (argc 0)
			  (argv 0))
  (let ((d (with-ref-par ((argc argc))
	     (xt_open_display context
			      (or host 0)
			      application-name
			      application-class
			      options 
			      num-options
			      argc
			      argv))))
    (if (zerop d)
	(error "cannot open the display: ~A" host))
    ;; Used for debugging:
    #+ignore
    (x11:xsynchronize d 1)
    d))

(defmethod initialize-instance :after ((d display) &rest args
				       &key display
				       &allow-other-keys)
  (push d (application-context-displays (slot-value d 'context)))
  (setf (foreign-pointer-address d)
    (or display
	(apply #'open-display args))))
