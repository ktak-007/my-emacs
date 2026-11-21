;;; treemacs.el ---                                  -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Stanislav Smirnov

;; Author: Stanislav Smirnov <ktak@ktak-nixos>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(use-package treemacs
  :bind
  ([f8] . treemacs)
  :custom-face
  (treemacs-window-background-face ((t (:height 100))))
  :custom
  (treemacs-width 25)
  (treemacs-expand-after-init nil)
  (treemacs-follow-after-init t)
  (treemacs-project-follow-cleanup t)
  :config
  (treemacs-resize-icons 18)
  (treemacs-follow-mode 1)
  (treemacs-git-mode 'deferred))

(use-package treemacs-icons-dired
  :ensure t
  :hook (dired-mode . treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;;; treemacs.el ends here
