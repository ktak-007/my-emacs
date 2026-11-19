;;; minimap.el --- Show minimap                      -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Commentary:

;; 

;;; Code:

(use-package minimap
  :ensure t
  :demand t
  :custom
  (minimap-window-location 'right)
  (minimap-minimum-width 10)
  (minimap-hide-fringes t)
  (minimap-major-modes '(prog-mode))
  ;;(minimap-excluded-modes '(lisp-interaction-mode))
  :config
  (minimap-mode 1))

;;; minimap.el ends here
