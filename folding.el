;;; folding.el --- Enable folding                    -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Code:

(setq excluded-modes '(ini-mode))

(defun my-hs-minor-mode ()
  (unless (member major-mode excluded-modes)
    (progn (hs-minor-mode)
	   (local-set-key [f4] 'my-hs-hide-block)
	   (local-set-key [S-f4] 'hs-show-block))))

(add-hook 'prog-mode-hook 'my-hs-minor-mode)

(defun my-hs-hide-block ()
  (interactive)
  (save-excursion
    (end-of-line)
    (hs-hide-block)))

;;; folding.el ends here
