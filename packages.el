
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Package management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

(setq package-selected-packages (list 'load-relative
				 'restart-emacs
				 'highlight-symbol
				 'magit
				 'ag
				 'company-irony
				 'ibuffer-projectile
				 'flycheck
				 'flycheck-tip
				 'noflet
				 'flex-isearch))

(package-install-selected-packages)

(dolist (pkg package-selected-packages)
  (require pkg))
