(add-hook 'haskell-mode-hook 'mxf/haskell)

(defun mxf/haskell ()
  (evil-define-key 'insert haskell-mode-map
    (kbd "C-n") 'ghc-complete)

  (setq inferior-haskell-find-project-root nil)
  (turn-on-haskell-indentation))
