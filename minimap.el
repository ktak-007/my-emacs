;;; minimap.el --- Show minimap                      -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Commentary:

;; 

;;; Code:

(use-package demap
  :config
  (add-hook 'prog-mode-hook 'demap-open))

(defun my-minimap-refresh ()
  (interactive)
  (progn (delete-other-windows)
	 (when (derived-mode-p 'prog-mode) (demap-open)))) ;; Refresh and restore minimap on window resize

;;; minimap.el ends here
