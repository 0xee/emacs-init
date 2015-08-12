(require 'package)

(add-to-list 'load-path "~/emacs/")

;(load-file "~/.emacs/elpa/load-relative-1.2/load-relative.el")

(load-file "~/emacs/custom.el")


;; External modules
(load-file "~/emacs/external/xml-parse.el")
(load-file "~/emacs/external/noflet.el")
(load-file "~/emacs/external/kill-ring-ido.el")
(load-file "~/emacs/external/doxymacs.el")
(load-file "~/emacs/external/protobuf.el")


;; Custom modules
(load-file "~/emacs/modules/whitespace-cfg.el")
(load-file "~/emacs/modules/move-text.el")

;(load-file "themes/wombat-customized.el")

;; Configuration
(load-file "~/emacs/packages.el")
(load-file "~/emacs/looknfeel.el")
(load-file "~/emacs/editing.el")
(load-file "~/emacs/persistence.el")


;; Languages
(load-file "~/emacs/languages/c.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Common development stuff
(require 'company)
(require 'projectile)
(global-company-mode)

;; needed for ag-project
(defun project-root-helper (foo)
  (projectile-project-root)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Package Configuration

;; company-irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;(load-file "~/.emacs.d/epy/epy-init.el")

(defun process-error-filename (filename)
  (let ((case-fold-search t))
    (setq f (replace-regexp-in-string "build/"
                                      (projectile-project-root)
                                       (replace-regexp-in-string "build/arch-pc/"
                                                                (projectile-project-root)
                                                                filename)))
    (cond ((file-exists-p f)
           f)
          (t filename))))

(setq compilation-parse-errors-filename-function 'process-error-filename)



(require 'protobuf)


(load-file "~/emacs/keybindings.el")

(projectile-global-mode t)
