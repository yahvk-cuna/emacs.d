;;; init-godot.el --- Godot
;;; Commentary:
;;; Code:

(use-package gdscript-mode
  :ensure t
  :config
  (setq gdscript-gdformat-save-and-format t))

(add-hook 'gdscript-mode-hook #'lsp)

(provide 'init-godot)
;;; init-godot.el ends here
