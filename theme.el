;;; Package --- Summary
;;; Commentary:
;;; Theme settings

;;; Code:

;; Тёмная тема
(use-package fantom-theme
  :config
  (load-theme 'fantom t)
  (eval-after-load "linum"
    '(set-face-foreground 'linum "#465a61")))

;;; theme.el ends here
