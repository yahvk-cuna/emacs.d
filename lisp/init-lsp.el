;;; init-lsp --- Language Server Protocol
;;; Commentary:
;;; Code:

(setq lsp-use-plists t)

;; (defun lsp-booster--advice-json-parse (old-fn &rest args)
;;   "Try to parse bytecode instead of json."
;;   (or
;;    (when (equal (following-char) ?#)
;;      (let ((bytecode (read (current-buffer))))
;;        (when (byte-code-function-p bytecode)
;;          (funcall bytecode))))
;;    (apply old-fn args)))
;; (advice-add (if (progn (require 'json)
;;                        (fboundp 'json-parse-buffer))
;;                 'json-parse-buffer
;;               'json-read)
;;             :around
;;             #'lsp-booster--advice-json-parse)

;; (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
;;   "Prepend emacs-lsp-booster command to lsp CMD."
;;   (let ((orig-result (funcall old-fn cmd test?)))
;;     (if (and (not test?)                             ;; for check lsp-server-present?
;;              (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
;;              lsp-use-plists
;;              (not (functionp 'json-rpc-connection))  ;; native json-rpc
;;              (executable-find "emacs-lsp-booster"))
;;         (progn
;;           (message "Using emacs-lsp-booster for %s!" orig-result)
;;           (cons "emacs-lsp-booster" orig-result))
;;       orig-result)))
;; (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

(use-package lsp-mode
  :custom
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (lsp-keymap-prefix "C-l")
  (lsp-eldoc-enable-hover nil)
  ;; (setq lsp-copilot-enabled t)
  (lsp-copilot-enabled nil)
  ;; (setq lsp-copilot-applicable-fn (lambda (buf-name buf-mode) (provided-mode-derived-p buf-mode 'prog-mode)))
  (lsp-lens-enable nil)
  (lsp-format-on-save nil)
  ;; (lsp-format-buffer-on-save-list '(rust-mode))
  :bind (:map lsp-mode-map ("C-l c" . lsp-execute-code-action))
  :config
  ;; https://github.com/emacs-lsp/lsp-mode/issues/5043
  (remove-hook 'lsp-after-apply-edits-hook #'lsp-diagnostics--clear-after-edit)

  :hook (
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :after (lsp-mode)
  :custom
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-diagnostic-max-lines 10)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-position 'top)
  :commands lsp-ui-mode)
(use-package lsp-treemacs :commands (lsp-treemacs-errors-list lsp-treemacs-symbols))
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
(use-package dap-mode
  :init
  (setq dap-gdb-debug-program '("rust-gdb" "-i" "dap"))
  :config
  (require 'dap-gdb))


(require-package 'yasnippet)
(add-hook 'lsp-mode-hook #'yas-minor-mode)

(provide 'init-lsp)
;;; init-lsp.el ends here
