;; Common
(load-theme 'tango-dark t)
;; Backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; Window & Frames
(setq ns-pop-up-frames nil)
(tool-bar-mode -1)
(scroll-bar-mode 'right)
(setq-default tab-width 4)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(term-color-blue ((t (:background "blue2" :foreground "dark cyan")))))

;; Package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (auto-package-update-maybe))

;; Term
(use-package term
  :bind ("C-c C-y" . term-paste)
  ;;:config
  ;;(custom-set-variables
  ;;   '(term-color-blue ((t (:background "blue2" :foreground "dark cyan")))))
  )

;; Ido mode
(use-package ido
  :config
  (setq ido-enable-flex-matching t)
  (ido-mode t))

;; Magit
(use-package magit
  :bind ("C-c g" . magit-status))

;; Projectile
(use-package projectile
  :bind-keymap (("s-p" . projectile-command-map)
				("C-c p" . projectile-command-map))
  :config
  (projectile-mode t))
