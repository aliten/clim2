;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Package: CLIM-INTERNALS; Base: 10; Lowercase: Yes -*-

;; $fiHeader: stream-defprotocols.lisp,v 1.4 92/02/24 13:08:31 cer Exp $

(in-package :clim-internals)

"Copyright (c) 1990, 1991, 1992 Symbolics, Inc.  All rights reserved.
 Portions copyright (c) 1988, 1989, 1990 International Lisp Associates."

;;--- What about the "original self" (delegation) problem??

;;; Fundamental input --- These should be on fundamental-input-character-stream??
(define-stream-protocol fundamental-input-stream)

(defoperation stream-read-char fundamental-input-stream
  ((stream fundamental-input-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-unread-char fundamental-input-stream
  ((stream fundamental-input-stream) character)
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-read-char-no-hang fundamental-input-stream
  ((stream fundamental-input-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-peek-char fundamental-input-stream
  ((stream fundamental-input-stream))  
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-listen fundamental-input-stream
  ((stream fundamental-input-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-read-line fundamental-input-stream
  ((stream fundamental-input-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-clear-input fundamental-input-stream
  ((stream fundamental-input-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

;;; The next three Genera-only generic functions allow CLIM streams to accept these
;;; Genera messages that do not have arguments compatible with the Gray functions.

#+Genera
(defoperation stream-compatible-read-char fundamental-input-stream
  ((stream fundamental-input-stream) &optional eof)
  (:selector :tyi))

#+Genera
(defoperation stream-compatible-read-char-no-hang fundamental-input-stream
  ((stream fundamental-input-stream) &optional eof)
  (:selector :tyi-no-hang))

#+Genera
(defoperation stream-compatible-peek-char fundamental-input-stream
  ((stream fundamental-input-stream) &optional eof)
  (:selector :tyipeek))

#+Genera
;; Called from si:with-clim-compatible-input-editing
(defoperation si:stream-compatible-input-editing fundamental-input-stream
  ((stream fundamental-input-stream)
   continuation activation-gesture-p delimiter-gesture-p))

#+Genera
;; READ calls this directly
(defoperation stream-compatible-any-tyi fundamental-input-stream
  ((stream fundamental-input-stream) &optional eof)
  (:selector :any-tyi))

#+Genera
;; READ calls this directly
(defoperation stream-compatible-any-tyi-no-hang fundamental-input-stream
  ((stream fundamental-input-stream) &optional eof)
  (:selector :any-tyi-no-hang))

#+Genera
(defoperation stream-compatible-interactive fundamental-input-stream
  ((stream fundamental-input-stream))
  (:selector :interactive))

#+Genera
(defoperation stream-compatible-input-wait fundamental-input-stream
  ((stream fundamental-input-stream) whostate function &rest arguments)
  (:selector :input-wait))


;;; Extended input
(define-stream-protocol basic-extended-input-protocol
  stream-input-buffer
  stream-pointers
  stream-primary-pointer)

(defoperation stream-read-gesture basic-extended-input-protocol
  ((stream basic-extended-input-protocol)
   &key timeout peek-p
	(input-wait-test *input-wait-test*)
	(input-wait-handler *input-wait-handler*)
	(pointer-button-press-handler *pointer-button-press-handler*)))

(defoperation stream-unread-gesture basic-extended-input-protocol
  ((stream basic-extended-input-protocol) gesture))

;;; Extended Input
(defoperation stream-input-wait basic-extended-input-protocol 
  ((stream basic-extended-input-protocol) &key timeout input-wait-test))

(defoperation stream-pointer-position* basic-extended-input-protocol
  ((stream basic-extended-input-protocol) &key (timeout 0) pointer)
  (declare (values x y)))

(defoperation stream-set-pointer-position* basic-extended-input-protocol
  ((stream basic-extended-input-protocol) x y &key pointer))

(defoperation stream-note-pointer-button-press basic-extended-input-protocol
  ((stream basic-extended-input-protocol) pointer button modifier-state x y))

(defoperation stream-pointer-input-rectangle* basic-extended-input-protocol
  ((stream basic-extended-input-protocol) pointer &key left top right bottom)
  (declare (values left top right bottom)))

(defoperation stream-accept basic-extended-input-protocol
  ((stream basic-extended-input-protocol) presentation-type &rest accept-args)
  (declare (values object type)))

(defoperation prompt-for-accept basic-extended-input-protocol
  ((stream basic-extended-input-protocol) type view &rest accept-args))


;;; Output

;;; Fundamental output
(define-stream-protocol fundamental-output-stream)
(define-stream-protocol fundamental-character-output-stream)

;;; This is not responsible for wrapping text.
(defoperation stream-write-char fundamental-character-output-stream 
  ((stream fundamental-character-output-stream) char)
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-write-string fundamental-character-output-stream
  ((stream fundamental-character-output-stream) string &optional (start 0) end)
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-terpri fundamental-character-output-stream
  ((stream fundamental-character-output-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-fresh-line fundamental-character-output-stream
  ((stream fundamental-character-output-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-force-output fundamental-output-stream
  ((stream fundamental-output-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-finish-output fundamental-output-stream
  ((stream fundamental-output-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-clear-output fundamental-output-stream
  ((stream fundamental-output-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-line-column fundamental-output-stream
  ((stream fundamental-output-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-start-line-p fundamental-output-stream
  ((stream fundamental-output-stream))
  #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

(defoperation stream-scan-string-for-writing fundamental-character-output-stream
  ((stream fundamental-character-output-stream) #+Silica medium
   string start end style cursor-x max-x &optional glyph-buffer))

(defoperation stream-scan-character-for-writing fundamental-character-output-stream
  ((stream fundamental-character-output-stream) character style cursor-x max-x))

(defoperation stream-write-string-1 fundamental-character-output-stream
  ((stream fundamental-character-output-stream) glyph-buffer start end font color x y))

#+Allegro
(defoperation excl::stream-interactive-force-output fundamental-output-stream
  ((stream fundamental-output-stream))
    #+CLIM-uses-lisp-stream-functions (:no-defgeneric t))

#+Genera
;; FORMAT calls this directly
(defoperation stream-compatible-output-as-presentation-1 fundamental-character-output-stream
  ((stream fundamental-character-output-stream)
   continuation continuation-args &rest object-options)
  (:selector :output-as-presentation-1))

#+Genera
(defoperation stream-compatible-output-as-presentation fundamental-character-output-stream
  ((stream fundamental-character-output-stream)
   continuation xstream &rest object-options)
  (:selector :output-as-presentation))

#+Genera
(defoperation stream-compatible-line-out fundamental-character-output-stream
  ((stream fundamental-character-output-stream) string &optional (start 0) end)
  (:selector :line-out))

#+Genera
(defoperation stream-compatible-with-character-style fundamental-character-output-stream
  ((stream fundamental-character-output-stream)
   new-style continuation xstream &optional bind-line-height)
  (:selector :with-character-style))

(define-stream-protocol basic-extended-output-protocol
  medium-foreground
  medium-background
  medium-text-style
  medium-default-text-style
  medium-merged-text-style
  stream-baseline
  stream-current-line-height
  stream-vertical-spacing
  stream-end-of-line-action
  stream-end-of-page-action
  stream-text-margin
  stream-default-view
  stream-display-device-type
  stream-output-glyph-buffer)

#+CLIM-1-compatibility
(define-compatibility-function (stream-vsp stream-vertical-spacing)
			       (stream)
  (stream-vertical-spacing stream))

(defoperation stream-cursor-position* basic-extended-output-protocol
  ((stream basic-extended-output-protocol))
  (declare (values x y)))

(defoperation stream-set-cursor-position* basic-extended-output-protocol
  ((stream basic-extended-output-protocol) x y))

;; Like STREAM-SET-CURSOR-POSITION*, but is more conservative about closing
;; the current text output record.
(defoperation stream-set-cursor-position*-internal basic-extended-output-protocol
  ((stream basic-extended-output-protocol) x y))

(defoperation stream-increment-cursor-position* basic-extended-output-protocol
  ((stream basic-extended-output-protocol) dx dy))

(defoperation stream-ensure-cursor-visible basic-extended-output-protocol
  ((stream basic-extended-output-protocol) &optional x y))

(defoperation stream-advance-cursor-x basic-extended-output-protocol
  ((stream basic-extended-output-protocol) amount))

(defoperation stream-advance-cursor-line basic-extended-output-protocol
  ((stream basic-extended-output-protocol)))

(defoperation stream-string-width basic-extended-output-protocol
  ((stream basic-extended-output-protocol) string &key (start 0) end text-style))

(defoperation stream-character-width basic-extended-output-protocol
  ((stream basic-extended-output-protocol) character &optional text-style))

(defoperation stream-line-height basic-extended-output-protocol
  ((stream basic-extended-output-protocol) &optional text-style))

(defoperation invoke-formatting-cell basic-extended-output-protocol
  ((stream basic-extended-output-protocol) continuation
   &key (align-x :left) (align-y :top) min-width min-height
	(record-type 'standard-cell-output-record)))

;; not sure this is the right place...
(defoperation incremental-redisplay basic-extended-output-protocol
  ((stream basic-extended-output-protocol)
   position erases moves draws erase-overlapping move-overlapping))

(defoperation decode-stream-for-writing basic-extended-output-protocol
  ((stream basic-extended-output-protocol) &optional brief-p))

#+Genera
(defoperation stream-compatible-cursor-position* basic-extended-output-protocol
  ((stream basic-extended-output-protocol) &optional unit)
  (:selector :read-cursorpos))

#+Genera
(defoperation stream-compatible-set-cursor-position* basic-extended-output-protocol
  ((stream basic-extended-output-protocol) x y &optional unit)
  (:selector :set-cursorpos))

#+Genera
(defoperation stream-compatible-increment-cursor-position* basic-extended-output-protocol
  ((stream basic-extended-output-protocol) x y &optional unit)
  (:selector :increment-cursorpos))

(define-stream-protocol drawing-state-mixin
  medium-ink
  medium-transformation
  medium-line-style
  medium-+Y-upward-p)

(defoperation invoke-with-drawing-options drawing-state-mixin
  ((stream drawing-state-mixin) function &rest options))

;;--- This should get done by define-graphics-operation!
(defoperation medium-draw-line* drawing-state-mixin
  ((stream drawing-state-mixin) from-x from-y to-x to-y))

(defoperation medium-draw-polygon* drawing-state-mixin
  ((stream drawing-state-mixin) list-of-x-and-ys closed filled))

(defoperation medium-draw-ellipse* drawing-state-mixin
  ((stream drawing-state-mixin)  center-x center-y 
				 radius-1-dx radius-1-dy radius-2-dx radius-2-dy 
				 start-angle end-angle filled))

(defoperation medium-draw-rectangle* drawing-state-mixin
  ((stream drawing-state-mixin)  from-x from-y to-x to-y filled))


;;; window protocol

#+Silica
(define-stream-protocol window-mixin)

#-Silica
(define-stream-protocol window-mixin
  window-parent
  window-children
  window-console
  window-name
  window-depth
  window-viewport
  window-update-region
  window-visibility
  window-label)

(defoperation window-clear window-mixin
  ((window window-mixin)))

(defoperation window-with-zero-viewport-position window-mixin
  ((window window-mixin) continuation))

#-Silica (progn
(defoperation window-erase-viewport window-mixin
  ((window window-mixin)))

(defoperation window-stack-on-top window-mixin
  ((window window-mixin)))

(defoperation window-stack-on-bottom window-mixin
  ((window window-mixin)))

(defoperation copy-area window-mixin
  ((window window-mixin)
   from-left from-top from-right from-bottom to-left to-top))

(defoperation window-refresh window-mixin
  ((window window-mixin)))

(defoperation window-expose window-mixin
  ((window window-mixin)))

(defoperation window-drawing-possible window-mixin
  ((window window-mixin)))

(defoperation window-viewport-position* window-mixin
  ((window window-mixin)))

(defoperation window-set-viewport-position* window-mixin
  ((window window-mixin) x y))

(defoperation redisplay-decorations window-mixin
  ((window window-mixin)) )

(defoperation window-to-screen-coordinates window-mixin
  ((window window-mixin) x y))

(defoperation screen-to-window-coordinates window-mixin
  ((window window-mixin) x y))

(defoperation window-inside-edges window-mixin
  ((window window-mixin))
  (declare (values left top right bottom)))

(defoperation window-inside-size window-mixin
  ((window window-mixin))
  (declare (values width height)))

(defoperation window-set-inside-edges window-mixin
  ((window window-mixin) new-left new-top new-right new-bottom))

(defoperation window-set-inside-size window-mixin
  ((window window-mixin) new-width new-height))

(defoperation window-inside-left window-mixin
  ((window window-mixin)))

(defoperation window-inside-top window-mixin
  ((window window-mixin)))

(defoperation window-inside-right window-mixin
  ((window window-mixin)))

(defoperation window-inside-bottom window-mixin
  ((window window-mixin)))

(defoperation window-inside-width window-mixin
  ((window window-mixin)))

(defoperation window-inside-height window-mixin
  ((window window-mixin)))

(defoperation window-label-size window-mixin
  ((window-mixin window-mixin) &optional (label (window-label window-mixin))))

(defoperation window-note-size-or-position-change window-mixin
  ((window window-mixin) new-left new-top new-right new-bottom))

(defoperation window-shift-visible-region window-mixin
  ((window window-mixin) 
   old-left old-top old-right old-bottom
   new-left new-top new-right new-bottom))

(defoperation window-flush-update-region window-mixin
  ((window window-mixin)))

(defoperation window-process-update-region window-mixin
  ((window window-mixin)))

(defoperation window-beep window-mixin
  ((window window-mixin)))

;;; What modifier keys are presently down?
(defoperation window-modifier-state window-mixin
  ((window window-mixin)))

)	;#-Silica


;;; Output recording.
(define-stream-protocol output-recording-mixin
  stream-drawing-p
  stream-recording-p
  stream-redisplaying-p
  stream-output-history
  stream-output-history-position
  stream-current-output-record
  stream-text-output-record
  stream-current-redisplay-record
  stream-highlighted-presentation)

(defoperation stream-add-output-record output-recording-mixin
  ((stream output-recording-mixin) record))

(defoperation stream-replay output-recording-mixin
  ((stream output-recording-mixin) &optional region))

(defoperation invoke-with-output-recording-options output-recording-mixin
  ((stream output-recording-mixin) continuation record draw))

(defoperation stream-close-text-output-record output-recording-mixin
  ((stream output-recording-mixin) &optional wrapped))

;;; Graphics protocol is in defs-graphics-generics
;;; Input editing stream protocol doesn't need to be encapsulated, for obvious reasons.


#+Silica (progn
(define-stream-protocol pane-protocol)

(defoperation pane-display-function pane-protocol
  ((pane pane-protocol)))

(defoperation pane-display-time pane-protocol
  ((pane pane-protocol)))

(defoperation pane-needs-redisplay pane-protocol
  ((pane pane-protocol)))

(defoperation pane-frame pane-protocol
  ((pane pane-protocol)))

)	;#+Silica
