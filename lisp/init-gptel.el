;;; init-gptel.el --- gptel
;;; Commentary:
;;; Code:

(use-package gptel
  :ensure t
  :config
  (setq
   gptel-model "llama3.1:latest"
   gptel-backend (gptel-make-ollama "Ollama"
                   :host "localhost:11434"
                   :stream t
                   :models '("llama3.1:latest"))))

(use-package gptel-extensions
  :vc (:fetcher github :repo "kamushadenes/gptel-extensions.el")
  :requires gptel)

(provide 'init-gptel)
;;; init-gptel.el ends here
