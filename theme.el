;;; Package --- Summary
;;; Commentary:
;;; Theme settings

;;; Code:

;; Тёмная тема darcula как в Jetbrains
(use-package idea-darkula-theme
  :config
  (load-theme 'idea-darkula t)
  (eval-after-load "linum"
    '(set-face-foreground 'linum "#465a61")))

;;; theme.el ends here
