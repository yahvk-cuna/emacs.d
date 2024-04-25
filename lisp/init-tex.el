;;; init-tex.el --- Support for the Java language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package tex
  :ensure auctex
  ;; :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq-default TeX-engine 'xetex)
  (setq-default TeX-PDF-mode t))

(use-package magic-latex-buffer
  :ensure
  :hook (LaTeX-mode . magic-latex-buffer))

(provide 'init-tex)
;;; init-tex.el ends here
