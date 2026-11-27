;;; blamer.el ---                                    -*- lexical-binding: t; -*-

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

;; Show blamer on the right inline
;; (use-package blamer
;;   :hook (prog-mode . blamer-mode))

;; Show blamer under the mode-line
(use-package blamer
  :hook (prog-mode . blamer-mode)
  :custom
  (blamer-type 'echo-area))

;; Show blamer on right w/o inline strings
;; (use-package blamer
;;   :hook (prog-mode . blamer-mode)
;;   :custom
;;   (blamer-type 'margin-overlay)
;;   :config
;;   (add-hook 'prog-mode-hook
;;             (lambda ()
;;               (setq-local right-margin-width 45)
;;               (set-window-margins nil nil 45))))

;;; blamer.el ends here
