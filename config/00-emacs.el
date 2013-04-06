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
(global-linum-mode 1)

(load-theme 'tango-dark t)

;; one character ought to be enough to answer questions
(fset 'yes-or-no-p 'y-or-n-p)
