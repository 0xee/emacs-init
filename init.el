(load-theme 'wombat)

(require 'package)

(load-file "~/.emacs.d/elpa/load-relative-1.2/load-relative.el")

(load-relative "external/xml-parse.el")

;; External modules
(load-relative "external/xml-parse.el")
(load-relative "external/noflet.el")
(load-relative "external/kill-ring-ido.el")
(load-relative "external/doxymacs.el")
(load-relative "external/protobuf.el")

;; Custom modules
(load-relative "modules/whitespace-cfg.el")
(load-relative "modules/move-text.el")
(load-relative "modules/date.el")

;(load-relative "themes/wombat-customized.el")

;; Configuration
(load-relative "packages.el")
(load-relative "looknfeel.el")
(load-relative "editing.el")
(load-relative "persistence.el")

;; Languages
(load-relative "languages/c.el")
(load-relative "languages/python.el")
(load-relative "languages/haskell.el")

(load-relative "custom.el")
(load-relative "projectile-cfg.el")


;; import stuff like user name,...
(load-file "~/.emacs.d/user.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Common development stuff
(require 'company)
(global-company-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Package Configuration

;; company-irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

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


(load-relative "keybindings.el")
