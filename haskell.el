;;; haskell.el --- Haskell mode                      -*- lexical-binding: t; -*-

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

;; (use-package haskell-mode)
(use-package haskell-mode
  :ensure t
  :config
  ;; Включаем встроенную замену символов на красивый Юникод в Haskell (портит выравнивание из-за коротких стрелоккк)
  ;; (setq haskell-font-lock-symbols t)

  ;; Дополнительно настраиваем, чтобы fira-code-mode не конфликтовал
  (add-hook 'haskell-mode-hook 'prettify-symbols-mode))

(with-eval-after-load 'haskell-indentation
  (setq haskell-indentation-starter-offset 4)
  (setq haskell-indentation-layout-offset 4)
  (setq haskell-indentation-left-offset 4))

;; (add-hook 'haskell-mode-hook #'lsp)
;; (use-package eglot
;;   :ensure nil
;;   :hook (haskell-mode . eglot-ensure))
(use-package eglot ;; eglot - show tips instead of lsp
  :ensure nil
  :hook ((haskell-mode . eglot-ensure)
         (eglot-managed-mode . my-eglot-setup)))
(defun my-eglot-setup ()
  ;; (eldoc-mouse-mode)
  ;; (eldoc-box-hover-mode)
  (eglot-inlay-hints-mode -1))

;; (use-package eldoc-box
;;   :ensure t
;;   :hook (eglot-managed-mode . eldoc-box-hover-mode))
;; (use-package eldoc-mouse
;;   :ensure t
;;   :hook (eglot-managed-mode . eldoc-mouse-mode))

(with-eval-after-load 'files
  (setq trusted-content
        '("/home/ktak/Haskell/"
          "/home/ktak/projects/"
          "/home/ktak/MyProjects/"
	  "/home/ktak/GitHub/ktak-007/")))

(defun my-haskell-prettify-p (start end match)
  (if (equal match ".")
      (let ((prev (char-before start))
            (next (char-after end)))
        (and prev next
             (not (or (eq (char-syntax prev) ?w)
                      (eq (char-syntax next) ?w)))))
    (prettify-symbols-default-compose-p start end match)))

;; (defun my-haskell-prettify ()
;;   (setq prettify-symbols-alist
;;         '(("\\" . "λ")
;; 	  ("->" . "→")
;;           ("<-" . "←")
;;           ("=>" . "⇒")
;;           ("::" . "∷")
;;           ("<=" . "≤")
;;           (">=" . "≥")
;;           ("/=" . "≠")
;;           ("==" . "≡")
;;           ;; (">>=" . "≫=")
;; 	  ;; (">>=" . "⤜")
;; 	  (">>=" . "≫=")
;;           ("=<<" . "=≪")
;;           ("." . "∘")
;;           ("<>" . "⋄")
;;           (">>" . "≫")
;;           ("forall" . "∀")
;;           ("<$>" . "⟨$⟩")
;;           ("<*>" . "⊛")))
;;   (setq prettify-symbols-compose-predicate
;;         #'my-haskell-prettify-p)
;;   (prettify-symbols-mode 1))

;; (add-hook 'haskell-mode-hook #'my-haskell-prettify)

(defun my-haskell-prettify ()
  (setq prettify-symbols-alist
        '(("\\" . "λ")
          ("." . "∘")
	  ("forall" . "∀")
	  ;; ("<$>" . "🄏")
          ;; ("<*>" . "⊛")
	  ))
  (setq prettify-symbols-compose-predicate
        #'my-haskell-prettify-p)
  (prettify-symbols-mode 1))

(add-hook 'haskell-mode-hook #'my-haskell-prettify)

(setq prettify-symbols-unprettify-at-point t) ;; Show original under cursor

(with-eval-after-load 'eglot
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (eglot-inlay-hints-mode -1))))
(with-eval-after-load 'eglot
  (require 'eldoc-box)
  (add-hook 'eglot-managed-mode-hook
            #'eldoc-box-mouse-mode))

;; 1. Установка шрифта по умолчанию (замените размер 12 на нужный)
;; (set-face-attribute 'default nil :font "Fira Code-12")

;; 2. Настройка пакета ligature.el
;; (use-package ligature
;;   :ensure t
;;   :config
;;   ;; Включение лигатур во всех языках программирования
;;   (ligature-set-ligatures 'prog-mode
;;     '(;; Стрелки
;;       "->" "<-" "==>" "<==" "=>" "<=" "=>" ">=" "->>" "<<-" "-->" "<--"
;;       ;; Логические операторы и сравнения
;;       "==" "!=" "===" "!==" "<>" "<~" "~>" "&&" "||"
;;       ;; Потоки и биты
;;       ">>" "<<" "||=" "&&="
;;       ;; Прочие частые комбинации
;;       "++" "--" "::" ":::" "==" "+++" "##" "###" "####" ".-" ".="
;;       "/*" "*/" "+++" "www" "??" "?." "?:" "!!" "/=")))

;; Включаем автоактивацию во всех буферах разработки
;; (global-ligature-mode t)

;; (use-package fira-code-mode
;;   :ensure t
;;   :hook (haskell-mode . fira-code-mode))

;; (use-package fira-code-mode
;;   :ensure t
;;   :custom
;;   ;; Вы можете отключить те лигатуры, которые вам не нравятся (например, "www")
;;   (fira-code-mode-disabled-ligatures '("www" "x"))
;;   :hook
;;   ;; Включаем режим во всех буферах с кодом
;;   (prog-mode . fira-code-mode))

;; (use-package fira-code-mode
;;   :ensure t
;;   :hook (haskell-mode . fira-code-mode)) ; Включит хак со стрелками только в Haskell
;; (use-package fira-code-mode
;;   :ensure t
;;   :hook (haskell-mode . fira-code-mode)
;;   :config
;;   ;; Настройка замены символов для Haskell
;;   (add-hook 'haskell-mode-hook
;;             (lambda ()
;;               ;; Заменяем бэкслеш \ (лямбду в Haskell) на символ λ
;;               ;; (push '("\\" . ?λ) prettify-symbols-alist)
;; 	      (push '("<*>" . "⊛") prettify-symbols-alist)
;; 	      ;; (setq prettify-symbols-alist
;; 	      ;;     '(("<*>" . "⊛")))
;; 	      (font-lock-add-keywords nil
;;                 `((,(rx "\\") (0 (progn (compose-region (match-beginning 0) (match-end 0) ?λ) nil)))))
;;               ;; Включаем режим отображения
;;               (prettify-symbols-mode 1))))

;; (use-package ligature
;;   :ensure t
;;   :config
;;   ;; Включаем полный набор лигатур Fira Code для всех языков программирования
;;   (ligature-set-ligatures 'prog-mode
;;     '(;; Монады и стрелки Haskell (>>=, =<<, ->, =>, ==>, <-, <==)
;;       ">>=" "=\<<" "-> " "=>" "==>" "<-" "<==" "-\<" "-\<<" "-~"
;;       ;; Логика, сравнения и операторы
;;       "==" "!=" "===" "!==" "<>" "<~" "~>" "&&" "||" "||=" "&&="
;;       ;; Потоки, биты, инкременты
;;       ">>" "<<" "++" "--" "::" ":::" ":=" "!!" "/="
;;       ;; Комментарии Haskell и спецсимволы
;;       "{-" "-}" "##" "###" "####" ".-" ".=" ".." "..<" "..."
;;       "/*" "*/" "www" "??" "?." "?:" "!!"
;;       ;; Математические комбинации
;;       "sqrt" "[|" "|]" "{|" "|}" "<|" "|>" "<|>" "::="
;;       ;; Функторы
;;       "<$>" "<*>"))

;;   ;; Включаем глобально
;;   (global-ligature-mode t))

(use-package ligature
  :ensure t
  :config
  ;; Официальный и полный список последовательностей для Fira Code
  (ligature-set-ligatures 'prog-mode
    '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
      "----" "-->" "->" "->>" "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
      ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
      "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-"
      ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->"
      "<+" "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~" "<~~" "</" "</>" "~@" "~-"
      "~>" "~~" "~~>" "%%"))

  ;; Активируем глобально во всех буферах разработки
  (global-ligature-mode t))


;; Настройка отступа на следующей строке после имени функции - один из вариантов выравнивается за имя функции.
(with-eval-after-load 'haskell-indentation
  (defun my-haskell-application-arg-column (base-indent)
    "Find the first argument column in a preceding function application."
    (save-excursion
      (beginning-of-line)
      (let ((found nil)
            (continue t))
	(while (and continue
                    (not found)
                    (= (forward-line -1) 0))
          (cond
           ((looking-at-p "^[ \t]*$")
            (setq continue nil))
           ((< (current-indentation) base-indent)
            (setq continue nil))
           (t
            (back-to-indentation)
	    (let ((end (line-end-position))
		  arg-pos)
	      (while (re-search-forward
		      "[[:alpha:]_][[:alnum:]_'.]*[ \t]+\\([(]\\)"
		      end t)
		(setq arg-pos (match-beginning 1)))
	      (when arg-pos
		(goto-char arg-pos)
		(setq found (current-column)))))))
	found)))

  (defun my-haskell-add-application-indent (original &rest args)
    "Add function argument alignment to Haskell indentation candidates."
    (let* ((indents (apply original args))
           (base (cl-loop for n in indents
                          when (> n 0)
                          minimize n))
           (column (and base
                        (not (nth 8 (syntax-ppss)))
                        (my-haskell-application-arg-column base))))
      (if (and column
               (not (memq column indents)))
          (sort (cons column indents) #'<)
        indents)))

  (advice-add 'haskell-indentation-find-indentations
              :around #'my-haskell-add-application-indent))

;;; haskell.el ends here
