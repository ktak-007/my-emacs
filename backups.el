;;; backups.el --- tune file backups

;;; Code:

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/auto-save-list"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


;;; Undo tree: try "C-x u" to see undo visualizer!
(use-package undo-tree
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-history-directory-alist
	'(("." . "~/.emacs.d/auto-save-list"))))    ; don't litter my fs tree

;;; backups.el ends here
