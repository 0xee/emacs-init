


(load-relative "../modules/includeguards")


(setq c-default-style "linux"
      c-basic-offset 2
      tab-width 2
      indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ixx\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cui\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; C/C++ development

(defun my-c-hook ()

  (semantic-add-system-include "../include" 'c++-mode)
  (semantic-add-system-include "../../include" 'c++-mode)
  (semantic-add-system-include "../../../include" 'c++-mode)
  (semantic-add-system-include "../../../../include" 'c++-mode)
  (local-set-key (kbd "C-c u") 'uncomment-region)
  (local-set-key (kbd "C-c z") 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c i") 'semantic-decoration-include-visit)
  (local-set-key (kbd "C-c r") 'ede-run-target)
  (local-set-key (kbd "C-c q") 'ede-proj-regenerate)
  (local-set-key (kbd "C-c p") 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-c w") 'senator-copy-tag)
  (local-set-key "\C-cf" 'senator-fold-tag-toggle)
  (global-semantic-stickyfunc-mode)
  (setq-local cc-search-directories
              (list "." "/usr/include" "/opt/ims/include" "~/svn/netlib/trunk/src"
                    (concat (projectile-project-root) "src")))
  (irony-mode))

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cui\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ixx\\'" . c++-mode))

(add-hook 'c-mode-common-hook 'my-c-hook)

;; semantic

(require 'cc-mode)
(require 'semantic)


(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)
