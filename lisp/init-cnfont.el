;;; init-cnfont -- config chinese font
;;; Commentary:
;;; Code:
(set-fontset-font "fontset-default" 'emoji "Noto Color Emoji" nil 'prepend)
(require-package 'cnfonts)
(cnfonts-mode 1)
(setq cnfonts-use-face-font-rescale t)

(defun cnfonts-set-symbol-fonts (_fontsizes-list)
  "Set emoji font."
  (set-fontset-font
   t
   'emoji
   (cond
    ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")
    ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
    ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
    ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
    ((member "Symbola" (font-family-list)) "Symbola"))
   nil 'prepend))
(add-hook 'cnfonts-set-font-finish-hook 'cnfonts-set-symbol-fonts)


(provide 'init-cnfont)
;;; init-cnfont.el ends here
