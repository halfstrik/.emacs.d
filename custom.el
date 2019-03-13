;;; custom.el --- Custom config file
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(anaconda-mode company-anaconda rtags company exec-path-from-shell flycheck projectile magit auto-package-update use-package)))
 '(safe-local-variable-values
   (quote
	((eval setq flycheck-gcc-include-path
		   (list
			(expand-file-name "~/Projects/anysolo-db.project/anysolo-db/")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-blue ((t (:background "blue2" :foreground "dark cyan")))))

;;; custom.el ends here
