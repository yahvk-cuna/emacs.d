;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flycheck
  :init
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  (setq flycheck-display-errors-delay 0.1)
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
