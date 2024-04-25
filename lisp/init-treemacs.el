;;; init-treemacs --- treemacs
;;; Commentary:
;;; Code:
(when (maybe-require-package 'treemacs)
  (with-eval-after-load 'projectile
    (require-package 'treemacs-projectile))
  (with-eval-after-load 'magit
    (require-package 'treemacs-magit)))

(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-x t 1") 'treemacs-delete-other-windows)
(global-set-key (kbd "C-x t t") 'treemacs)
(global-set-key (kbd "C-x t B") 'treemacs-bookmark)
(global-set-key (kbd "C-x t C-t") 'treemacs-find-file)
(global-set-key (kbd "C-x t M-t") 'treemacs-find-tag)

(provide 'init-treemacs)
;;; init-treemacs.el ends here
