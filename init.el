;;; init.el --- Summary
;;; Commentary:
;;; Main EMACS settings file, load settings from parts.

;;; Code:

(require 'package)

;; Расширим список доступных пакетов
(customize-set-variable
 'package-archives '(("org"   . "https://orgmode.org/elpa/")
                     ("melpa" . "https://melpa.org/packages/")
		     ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Установим use-package для упрощения управления пакетами
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
;; Включаем автоматическую установку
(setq use-package-always-ensure t)

;;; Указываем откуда брать части настроек.
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory) user-emacs-directory)
        ((boundp 'user-init-directory) user-init-directory)
        (t "~/.emacs.d/")))

;;; Функция для загрузки настроек из указанного файла.
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; Пусть emacs хранит custom-настройки в отдельном файле
(setq custom-file "~/.emacs.d/customize.el")
(load-user-file "customize.el")

(mapc 'load-user-file '("theme.el"
			"personal.el"
			"markdown.el"
			"backups.el"))

;;; .emacs ends here
