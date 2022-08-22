;;; parens.el --- Parens                             -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Code:

(use-package smartparens
  :config
  (smartparens-global-mode 1))

;; Show matching pairs
(use-package mic-paren
  :config
  (paren-activate))

;;; parens.el ends here
