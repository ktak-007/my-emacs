;;; neotree.el --- Sidebar                           -*- lexical-binding: t; -*-

;;; Commentary:

;; Neotree sidebar

;;; Code:

(use-package
  neotree
  :bind ([f8] . neotree-toggle)
  :init (setq neo-window-width 15)
  :config
  (setq neo-smart-open nil)
  (set-face-font 'neo-dir-link-face "8")
  (set-face-font 'neo-file-link-face "8")
  (set-face-font 'neo-root-dir-face "8"))

;;; neotree.el ends here
