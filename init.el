(load-theme 'wombat)

(require 'package)

(defun rel2abs (rel)
  (concat (file-name-directory (or load-file-name buffer-file-name)) rel)
  )

(load-file (rel2abs "packages.el"))


;; External modules
(load-relative "external/kill-ring-ido.el")

;; Custom modules
(load-relative "modules/whitespace-cfg.el")
(load-relative "modules/move-text.el")
(load-relative "modules/date.el")
(load-relative "modules/maly-mode.el")

;; ;; Configuration
(load-relative "looknfeel.el")
(load-relative "editing.el")

;; (load-relative "persistence.el")
(load-relative "ide.el")

;; Languages
(load-relative "languages/c.el")
(load-relative "languages/python.el")
;(load-relative "languages/haskell.el")
(load-relative "languages/cuda.el")
(load-relative "languages/lisp.el")
(load-relative "languages/protobuf.el")

(load-relative "projectile-cfg.el")
(load-relative "jabber-cfg.el")

(defconst user-init-file "~/.emacs.d/user.el")

(unless (file-exists-p user-init-file)
  (write-region "" nil user-init-file))

;; import stuff like user name, accounts, etc.
(load-file user-init-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Common development stuff
(package-require 'company)
(package-require 'flycheck)

(global-company-mode)

(set-variable 'org-replace-disputed-keys t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Package Configuration

;; company-irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(defun process-error-filename (filename)
  (let ((case-fold-search t))
    (setq f (replace-regexp-in-string
             "build/" ""
             (replace-regexp-in-string "build/arch-pc/" ""
                                       filename)))
    (cond ((file-exists-p f) f)
          (t filename))))


(setq compilation-parse-errors-filename-function 'process-error-filename)

(require 'protobuf)

(load-relative "keybindings.el")

(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic))))


(defun query-replace-repeat ()
  (interactive)
  (let ((from (car (cdr query-replace-history))) (to (car query-replace-history)))
    (query-replace from to)
    )
  )

(global-set-key (kbd "C-%") 'query-replace-repeat)

(load-relative "custom.el")
