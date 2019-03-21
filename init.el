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
(setq column-number-mode t)

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

;; Helm
(use-package helm
  :bind ("M-x" . helm-M-x))

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

;; Company - autocomplition
(use-package company
  :init
  (global-company-mode))

;; Python
(use-package anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'eldoc-mode))

;; Python - anaconda-mode + company-anaconda
(use-package company-anaconda
  :config
  (add-to-list 'company-backends '(company-anaconda :with company-capf)))

;; Python virtualenv manager - venvs located ~/.virtualenvs/ by default
(use-package virtualenvwrapper)

;; RTags - C/C++
(use-package rtags
  :load-path "~/.emacs.d/site-lisp/rtags/"
  :init
  (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
  (add-hook 'c++-mode-hook 'rtags-start-process-unless-running))

;; C/C++ company-rtags
(use-package company-rtags
  :load-path "~/.emacs.d/site-lisp/rtags/"
  :config
  (add-to-list 'company-backend 'company-rtags))

;;; init.el ends here
