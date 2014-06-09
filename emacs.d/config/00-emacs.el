;; Font is currently set via *.font in .Xresources
; (add-to-list 'default-frame-alist '(font . "Fixed 13"))

;; don't show splash screen
(setq inhibit-startup-message t)

(blink-cursor-mode 0)

;; disable almost all UI features
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 0)

(load-theme 'tango-dark t)

;; hilight matching parens
(show-paren-mode t)

;; display line & column in status
(column-number-mode t)

;; useless whitespace
(setq-default indicate-empty-lines t)
(setq-default show-trailing-whitespace t)

;; unfortunately, this doesn't work like I thought it would:
;; I'd like numbers only in buffers i edit text (as in sourcecode) in
(require 'linum)
; (global-linum-mode 1)

(setq locale-coding-system 'utf-8)
(flyspell-prog-mode)  ;; spell-checking in comments and strings

;; a saner switch buffer
(iswitchb-mode 1)

;; Store backups in a single directory (/tmp/emacs-backups) so that
;; they don’t clutter up my filesystem.
(let ((backupdir "~/.emacs.d/backups/"))
  (mkdir backupdir t)
  (setq backup-directory-alist `(("." . ,backupdir))))

;; one character ought to be enough to answer questions
(fset 'yes-or-no-p 'y-or-n-p)
