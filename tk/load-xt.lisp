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
;; $fiHeader: load-xt.lisp,v 1.3 92/07/27 19:28:59 cer Exp $

(in-package :tk)



;;;; 

(defvar sys::*libxt-pathname* "/x11/R4/sun4-lib/libXt.a")


(defun load-from-xt ()
  (x11::load-undefined-symbols-from-library
   "stub-xt.o"
   (x11::symbols-from-file "misc/undefinedsymbols.xt")
   (list sys::*libxt-pathname* sys::*libx11-pathname*)))

(load-from-xt)

