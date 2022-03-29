;;; minimap.el --- Show minimap                      -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Commentary:

;; 

;;; Code:

(use-package demap
  :config
  (add-hook 'find-file-hook 'demap-open))

;;; minimap.el ends here
