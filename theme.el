;;; Package --- Summary
;;; Commentary:
;;; Theme settings

;;; Code:

;; Тёмная тема
(use-package ef-themes
  :config
  (load-theme 'ef-night :no-confirm)
  (setq ef-themes-mode-line '(accented borderless))
  (with-eval-after-load 'display-line-numbers
    (set-face-foreground 'line-number "#465a61")))

(use-package powerline
  :init (powerline-default-theme))

;;; theme.el ends here
