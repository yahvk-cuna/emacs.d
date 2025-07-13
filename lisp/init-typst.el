;;; init-typst.el --- Setting Github Copilot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package websocket)
(use-package typst-preview
  :vc (:url "https://github.com/havarddj/typst-preview.el.git"
            :rev :newest
            :branch "main")
  :commands typst-preview-mode)

(use-package typst-ts-mode
  :vc (:url "https://codeberg.org/meow_king/typst-ts-mode.git"
            :rev :newest
            :branch "main"
            )
  :after lsp-mode
  :mode "\\.ts\\'"
  :hook ((typst-ts-mode . lsp)
         (typst-ts-mode . puni-mode))
  :custom
  (typst-ts-mode-watch-options "--open")
  :config
  (setq electric-pair-inhibit-predicate
        (lambda (char)
          (or (char-equal char ?$)
              (electric-pair-default-inhibit char))))
  (add-to-list 'lsp-language-id-configuration '(typst-ts-mode . "typst"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection "tinymist")
    :major-modes '(typst-ts-mode)
    :server-id 'typst-lsp)))

(use-package lsp-ltex-plus
  :after (lsp-mode typst-ts-mode)
  :vc (:url "https://github.com/emacs-languagetool/lsp-ltex-plus.git"
            :rev :newest)
  :init
  (setq lsp-ltex-plus-version "18.4.0")
  (defcustom lsp-ltex-plus-active-modes
    '( text-mode
       bibtex-mode context-mode
       LaTeX-mode
       markdown-mode gfm-mode
       org-mode
       rst-mode
       message-mode mu4e-compose-mode
       typst-ts-mode)
    "List of major mode that work with LTEX+ Language Server."
    :type '(list symbol)
    :group 'lsp-ltex-plus)
  :config
  (add-to-list 'lsp-language-id-configuration
               '(typst-ts-mode . 'ltex-ls-plus)))

  (provide 'init-typst)
;;; init-typst.el ends here
