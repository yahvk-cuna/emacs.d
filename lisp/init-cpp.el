;;; init-lsp --- Language Server Protocol
;;; Commentary:
;;; Code:
(require-package 'ccls)
(add-hook 'cpp-mode-hook #'lsp)

(provide 'init-cpp)
;;; init-cpp.el ends here
