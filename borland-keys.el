;;; borland-keys.el --- Borland-like keys            -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;; Author: Stanislav Smirnov <ktak@ssmirnov-ThinkPad-T480>
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

;; Borland's IDEs like keys

;;; Code:

(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'find-file)
(global-set-key (kbd "<f5>") 'delete-other-windows)
(global-set-key [f6] 'other-window)
(global-set-key (kbd "<f7>") 'nonincremental-re-search-forward)
(global-set-key (kbd "S-<f7>") 'nonincremental-repeat-search-forward)
(global-set-key (kbd "C-<f7>") 'replace-regexp)

;;; borland-keys.el ends here
