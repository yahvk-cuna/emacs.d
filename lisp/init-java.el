;;; init-java.el --- Support for the Java language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-java
  :ensure
  :config (add-hook 'java-mode-hook 'lsp))

(provide 'init-java)
;;; init-java.el ends here
