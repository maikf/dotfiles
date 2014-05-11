;; Font is currently set via *.font in .Xresources
; (add-to-list 'default-frame-alist '(font . "Fixed 13"))

;; don't show splash screen
(setq inhibit-startup-message t)

(blink-cursor-mode 0)
(scroll-bar-mode -1)
(tool-bar-mode -1)
; (tooltip-mode -1)

;; hilight matching parens
(show-paren-mode t)

;; display line & column in status
(column-number-mode t)

;; and line numbers
(require 'linum)
;; unfortunately, this doesn't work like I thought it would:
;; I'd like numbers only in buffers i edit text (as in sourcecode) in
; (global-linum-mode 1)

;; a saner switch buffer
(iswitchb-mode 1)

(load-theme 'tango-dark t)

;; Store backups in a single directory (/tmp/emacs-backups) so that
;; they don’t clutter up my filesystem.
(let ((backupdir "/tmp/emacs-backups/"))
  (mkdir backupdir t)
  (setq backup-directory-alist `(("." . ,backupdir))))

;; one character ought to be enough to answer questions
(fset 'yes-or-no-p 'y-or-n-p)
