;;; Package --- Summary
;;; Commentary:
;;; User settings for .emacs

;;; Code:

;;; Цветные скобочки
(use-package
  rainbow-delimiters
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (setq rainbow-delimiters-max-face-count 9))

;;; Scrolling
(setq scroll-step               1) ;; one line
(setq scroll-margin            10) ;; scroll buffer to 10 lines at going to last line
(setq scroll-conservatively 10000)
(setq directory-free-space-args "-Pm")

;; Подсветка результатов поиска и всё такое
(setq search-highlight        t)
(setq query-replace-highlight t)

(setq column-number-mode 1) ;; Номера строк слева

(save-place-mode 1) ;; Remember the cursor position

(global-hl-line-mode 1) ;;; Подсветка текущей строки
(add-hook 'find-file-hook 'linum-mode) ;; Show line numbers on opened files

;;; Умные скобочки
(use-package
  smartparens
  :config (smartparens-global-mode 1))

;; Electric pair mode
(electric-pair-mode 1)

;; Иконки в статус-баре
(use-package
  mode-icons
  :config (mode-icons-mode 1))

;; Показывать отступы во всех режимах
(use-package
  indent-guide
  :config (indent-guide-global-mode 1))

;; Auto fill new file with some content
(auto-insert-mode t)
(fset 'yes-or-no-p 'y-or-n-p) ;;; Understand y and n instead of yes and no

(scroll-bar-mode -1) ;; Scrollbars off

;; Some fonts
(set-face-font 'default "Fira Code-14")
(set-face-font 'mode-line "Fira Code-10")
(eval-after-load "linum"
  '(set-face-attribute 'linum nil :height 100))

;;; personal.el ends here
