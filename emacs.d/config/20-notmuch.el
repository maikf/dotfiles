;; no bold font
(setq notmuch-search-line-faces
      '(("unread" :weight normal)))

;; Use sendmail(1) to send emails.
(setq message-send-mail-function 'message-send-mail-with-sendmail)

;; Required so Postfix will set the correct Return-Path
; (setq message-sendmail-envelope-from "maikf@qu.cx")
; (setq mail-specify-envelope-from t

;; When starting, don't load notmuch-hello, but jump directly to inbox.
(defun notmuch ()
  (interactive)
  (notmuch-search (cdr (first notmuch-saved-searches))))
