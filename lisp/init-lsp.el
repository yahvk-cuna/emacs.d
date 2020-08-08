;;; init-lsp --- Language Server Protocol
;;; Commentary:
;;; Code:
(require-package 'lsp-mode)
(require-package 'lsp-ui)
(setq lsp-keymap-prefix "C-l")

(after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "M-.") 'lsp-find-definition)
  (define-key lsp-mode-map (kbd "M-/") 'lsp-find-references))

(require-package 'yasnippet)
(yas-global-mode 1)

(provide 'init-lsp)
;;; init-lsp.el ends here
