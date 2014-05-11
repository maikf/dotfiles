(require 'package)
(package-initialize)

;; prefer marmalade over bleeding-edge melpa
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defun my-install-if-missing (package-list)
  (dolist (p package-list)
    (when (not (package-installed-p p))
      (package-refresh-contents)
      (package-install p))))
