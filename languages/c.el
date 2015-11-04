
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
  (local-set-key (kbd "C-c u") 'uncomment-region)
  (local-unset-key (kbd "C-c C-n"))
  (local-unset-key (kbd "C-c C-p"))
  (setq-local cc-search-directories
              (list "." "/usr/include" "/opt/ims/include" "~/svn/netlib/trunk/src"
                    (concat (projectile-project-root) "src")))
  (irony-mode)
  (subword-mode)
  (flycheck-mode)
  (setq flycheck-clang-include-path
        (list "." ".." "../.." "../../.."
              (concat (projectile-project-root) "src")
              (concat (projectile-project-root) "build/arch-pc/Interface/ims/pb2")
              "/opt/ims/include/netlib"
              "/opt/ims/include/oasis"
              "/opt/cuda/include"
              "/opt/ofed/include"))
)


(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cui\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ixx\\'" . c++-mode))

(add-hook 'c-mode-common-hook 'my-c-hook)

;(add-hook 'c-mode-hook (lambda () (set flycheck-clang-include-path (list "." ".." "../.." "../../.."))))
                                        ;(concat (projectile-project-root) "/src"))))


(require 'cc-mode)

(defun switch-to-flycheck-error-list ()
  (interactive)
  (switch-to-buffer-other-window "*Flycheck errors*")
)

(global-set-key (kbd "C-c C-f") 'switch-to-flycheck-error-list)
