(require 'package)

(add-to-list 'load-path "~/emacs")

;(load-file "~/.emacs/elpa/load-relative-1.2/load-relative.el")

;; External modules
(load-file "external/xml-parse.el")
(load-file "external/noflet.el")
(load-file "external/kill-ring-ido.el")
(load-file "external/doxymacs.el")
(load-file "external/protobuf.el")
;(load-file "external/theme.el")


;; Custom modules
(load-file "modules/whitespace-cfg.el")
(load-file "modules/move-text.el")

;; Configuration
(load-file "packages.el")
(load-file "looknfeel.el")
(load-file "editing.el")


;; Languages
(load-file "languages/c.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Common development stuff
(require 'company)
(global-company-mode)
(projectile-global-mode)

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


(load-file "keybindings.el")
