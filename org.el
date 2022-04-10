;;; org.el --- My org mode                           -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Commentary:

;; The config of modern mode has been taken from https://github.com/minad/org-modern

;;; Code:

(use-package org-modern
  :config
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"

   ;; Agenda styling
   org-agenda-block-separator ?─
   org-agenda-time-grid '((daily today require-timed)
			  (800 1000 1200 1400 1600 1800 2000)
			  " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string "⭠ now ─────────────────────────────────────────────────")

  ;; Enable org-modern-mode with intendations
  (add-hook 'org-mode-hook (lambda ()
			     (org-modern-mode)
			     (org-indent-mode t)))
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))

;;; org.el ends here
