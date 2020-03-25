;;; init-lsp --- Language Server Protocol
;;; Commentary:
;;; Code:
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'company-lsp)
(setq lsp-keymap-prefix "C-l")

(after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "M-.") 'lsp-find-definition)
  (define-key lsp-mode-map (kbd "M-/") 'lsp-find-references))

(require-package 'yasnippet)

(provide 'init-lsp)
;;; init-lsp.el ends here
