;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Package: CL-USER; Base: 10; Lowercase: Yes -*-
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
;; $Id: sysdcl.lisp,v 2.7 2007/04/17 21:45:51 layer Exp $

(in-package #-ANSI-90 :user #+ANSI-90 :cl-user)

;;;"Copyright (c) 1990, 1991, 1992 Symbolics, Inc.  All rights reserved."

(clim-defsys:defsystem clx-clim
    (:default-pathname #+Genera "SYS:CLIM;REL-2;CLX;"
		       #-Genera (frob-pathname "clx")
     :default-binary-pathname #+Genera "SYS:CLIM;REL-2;CLX;"
			      #-Genera (frob-pathname "clx")
     :load-before-compile (clim-standalone))
  ("pkgdcl")
  ("clx-port")
  ("clx-mirror")
  ("clx-medium")
  ("clx-pixmaps")
  ("clx-frames")
  ("clx-prefill" :features (or Genera Cloe-Runtime)))

#+Genera
(clim-defsys:import-into-sct 'clx-clim
  :pretty-name "CLX CLIM"
  :default-pathname "SYS:CLIM;REL-2;CLX;"
  :required-systems '(clim)
  :bug-reports "Bug-CLIM"
  :patches-reviewed "Bug-CLIM-Doc")

#+Minima-Developer
(clim-defsys:import-into-sct 'clx-clim :subsystem t
  :sct-name :minima-clx-clim-standalone
  :pretty-name "Minima CLX CLIM Standalone"
  :default-pathname "SYS:CLIM;REL-2;CLX;"
  :default-destination-pathname "SYS:CLIM;REL-2;CLX;")

#+Minima-Developer
(zl:::sct:defsystem minima-clx-clim
    (:pretty-name "Minima CLX CLIM"
     :default-pathname "SYS:CLIM;REL-2;CLX;"
     :journal-directory "SYS:CLIM;REL-2;CLX;PATCH;"
     :maintain-journals nil
     :default-module-type :system
     :patches-reviewed "Bug-CLIM-Doc"
     :source-category :optional)
  (:serial "minima-clim" "minima-clx-clim-standalone"))
