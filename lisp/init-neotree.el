(require-package 'neotree)
(require-package 'all-the-icons)

(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(provide 'init-neotree)
