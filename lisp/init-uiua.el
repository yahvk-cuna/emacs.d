;;; init-uiua.el --- Support for the Uiua programming language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(or (maybe-require-package 'uiua-ts-mode)
    (maybe-require-package 'uiua-mode))

;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs '((uiua-mode uiua-ts-mode) . ("uiua" "lsp"))))
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(uiua-mode . "uiua"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "uiua" "lsp")
                    :activation-fn (lsp-activate-on "uiua")
                    :server-id 'uiua)))

(maybe-require-package 'nixpkgs-fmt)

(provide 'init-uiua)
;;; init-uiua.el ends here
