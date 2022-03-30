;;; folding.el --- Enable folding                    -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Code:

(add-hook 'prog-mode-hook 'hs-minor-mode)

(defun my-hide-block ()
  (interactive)
  (save-excursion
    (end-of-line)
    (hs-hide-block)))

(global-set-key [f4] 'my-hide-block)
(global-set-key [S-f4] 'hs-show-block)

;;; folding.el ends here
