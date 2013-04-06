(defun my-dir (subdir)
  (concat user-emacs-directory (convert-standard-filename subdir)))

;; add ~/.emacs.d/elisp/ and containing subdirs to load-path
;; http://emacswiki.org/emacs/LoadPath
(dolist (dir '("elisp/"))
  (let ((default-directory (my-dir dir)))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path)))

;; return a sorted list of my subconfig
(defun my-config-files ()
  (let ((dir (my-dir "config/"))
	(rx "^[[:digit:]][[:digit:]]-.*\.el$"))
    (directory-files dir t rx t)))

;; load subconfig
(defun my-load-config ()
  (dolist (f (my-config-files))
    (load (substring f 0 -3))))

(my-load-config)
