;;; init-lsp --- Language Server Protocol
;;; Commentary:
;;; Code:
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'company-lsp)
(setq lsp-enable-snippet nil)

(after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "M-.") 'lsp-find-definition)
  (define-key lsp-mode-map (kbd "M-/") 'lsp-find-references))

(provide 'init-lsp)
;;; init-lsp.el ends here
