;;; init-undo -- undo tree
;;; Commentary:
;;; Code:
(use-package vundo
  :bind ("C-x u" . vundo))

(use-package undo-fu
  :bind (("C-/" . undo-fu-only-undo)
         ("C-?" . undo-fu-only-redo)))

(provide 'init-undo)
;;; init-undo.el ends here
