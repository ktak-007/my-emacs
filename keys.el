;;; borland-keys.el --- Borland-like keys            -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Code:


;; Borland's IDEs like keys
(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'find-file)
(global-set-key (kbd "<f5>") 'delete-other-windows)
(global-set-key [f6] 'other-window)
(global-set-key (kbd "<f7>") 'nonincremental-re-search-forward)
(global-set-key (kbd "S-<f7>") 'nonincremental-repeat-search-forward)
(global-set-key (kbd "C-<f7>") 'replace-regexp)

;; Other keys
(defun my-kill-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "<f12>") 'my-kill-buffer)

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "A-g") 'goto-line)

(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-left>") 'windmove-left)

(global-set-key (kbd "C-S") 'isearch-forward-regexp)
(global-set-key (kbd "C-R") 'isearch-backward-regexp)

(defun my-next-line ()
  "Move to the next line with recentering."
  (interactive)
  (forward-line)
  (recenter))

(defun my-previous-line ()
  "Move to the previous line with recentering."
  (interactive)
  (forward-line -1)
  (recenter))

(global-set-key [A-down] 'my-next-line)
(global-set-key [A-up] 'my-previous-line)

;;; borland-keys.el ends here