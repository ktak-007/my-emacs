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

(setq-default save-place t) ;; Помнить, где был курсор в прошлый раз

(global-hl-line-mode 1) ;;; Подсветка текущей строки
(global-linum-mode 1)   ;;; Показывать номера строк всегда

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

;;; Дерево отмены
(use-package
  undo-tree
  :config (global-undo-tree-mode 1))

;;; personal.el ends here
