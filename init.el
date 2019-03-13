;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Code:

;; Custom UI
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
   (when (file-exists-p custom-file)
     (load custom-file))

(load-theme 'tango-dark t)
;; Backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; Window & Frames
(setq ns-pop-up-frames nil)
(tool-bar-mode -1)
(scroll-bar-mode 'right)
(setq-default tab-width 4)

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

(use-package term
  :bind ("C-c C-y" . term-paste))

;; Ido - narrowing framework
(use-package ido
  :config
  (setq ido-enable-flex-matching t)
  (ido-mode t))

;; Magit - git integration
(use-package magit
  :bind ("C-c g" . magit-status))

;; Projectile - projects aware tools
(use-package projectile
  :bind-keymap (("s-p" . projectile-command-map)
				("C-c p" . projectile-command-map))
  :config
  (projectile-mode t))

;; Flycheck - statick code analysis
(use-package flycheck
  :init
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(c/c++-clang)))

;; Environment fixup on MacOS
(use-package exec-path-from-shell
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :config
  (exec-path-from-shell-initialize))

;; RTags - C/C++
(use-package rtags)

;; Company - autocomplition
(use-package company)

;; TODO: Python - anaconda-mode + company-anaconda

;;; init.el ends here

