(autoload 'cperl-mode "cperl-mode" "CPerl mode" t)

(defalias 'perl-mode 'cperl-mode)

;;;; indentation settings
(add-hook 'cperl-mode-hook
	  (lambda ()
	    (setq
	     cperl-continued-statement-offset 4
	     cperl-indent-level 4
	     cperl-indent-parens-as-block t
	     cperl-tabs-always-indent t
	     cperl-indent-subs-specially nil)))
