;;; init-copilot.el --- Setting Github Copilot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'editorconfig)
(use-package copilot
  :vc (:fetcher github :repo copilot-emacs/copilot.el)
  :bind ( :map copilot-completion-map
          ("C-<tab>" . copilot-accept-completion)
          :map copilot-mode-map
          ("M-C-<next>" . copilot-next-completion)
          ("M-C-<prior>" . copilot-previous-completion)
          ("M-C-<right>" . copilot-accept-completion-by-word)
          ("M-C-<down>" . copilot-accept-completion-by-line))
  :hook (prog-mode . copilot-mode))

(provide 'init-copilot)
;;; init-copilot.el ends here

