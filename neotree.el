;;; neotree.el --- Sidebar                           -*- lexical-binding: t; -*-

;;; Commentary:

;; Neotree sidebar

;;; Code:

(use-package
  neotree
  :bind ([f8] . neotree-toggle)
  :init (setq neo-window-width 35)
  :config (setq neo-smart-open nil))

;;; neotree.el ends here
