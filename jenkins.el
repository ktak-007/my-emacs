;;; jenkins.el --- Jenkinsfile mode                  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Stanislav Smirnov

;;; Commentary:

;; Use groovy mode for the Jenkinsfile(s)

;;; Code:

(use-package groovy-mode
  :config
  (setq auto-mode-alist
	(cons '("Jenkinsfile\\..*$" . groovy-mode)
	      auto-mode-alist)))

;;; jenkins.el ends here
