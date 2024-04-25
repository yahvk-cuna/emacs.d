;;; init-nix.el --- Support for the Nix package manager -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(if (maybe-require-package 'nix-ts-mode)
    (when (and (fboundp 'treesit-ready-p) (treesit-ready-p 'nix t))
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode)))
  (maybe-require-package 'nix-mode))

;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs '((nix-mode nix-ts-mode) . ("nil"))))
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '((nix-mode nix-ts-mode) . "nix"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "nil")
                    :activation-fn (lsp-activate-on "nix")
                    :server-id 'nix)))

(maybe-require-package 'nixpkgs-fmt)

(provide 'init-nix)
;;; init-nix.el ends here
