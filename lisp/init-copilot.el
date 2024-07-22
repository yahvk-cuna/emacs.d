;;; init-copilot.el --- Setting Github Copilot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'editorconfig)
(require 'copilot)

(define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion)
(define-key copilot-mode-map (kbd "M-C-<next>") #'copilot-next-completion)
(define-key copilot-mode-map (kbd "M-C-<prior>") #'copilot-previous-completion)
(define-key copilot-mode-map (kbd "M-C-<right>") #'copilot-accept-completion-by-word)
(define-key copilot-mode-map (kbd "M-C-<down>") #'copilot-accept-completion-by-line)

(add-hook 'prog-mode-hook 'copilot-mode)

(provide 'init-copilot)
;;; init-copilot.el ends here

