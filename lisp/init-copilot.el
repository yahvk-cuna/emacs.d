;;; init-copilot.el --- Setting Github Copilot -*- lexical-binding: t -*-;
;;; Commentary:
;;; Code:
(use-package copilot
  :ensure t
  :hook (prog-mode . (lambda () (if (not (or buffer-read-only (string-prefix-p "*" (buffer-name)))) (copilot-mode))))
  :bind ( :map copilot-completion-map
          ("C-<tab>" . copilot-accept-completion)
          :map copilot-mode-map
          ("M-C-<next>" . copilot-next-completion)
          ("M-C-<prior>" . copilot-previous-completion)
          ("M-C-<right>" . copilot-accept-completion-by-word)
          ("M-C-<down>" . copilot-accept-completion-by-line))
  )

(provide 'init-copilot)
;;; init-copilot.el ends here

