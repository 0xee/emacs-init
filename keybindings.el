
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Global keybindings
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "M-#") 'quick-calc)
(global-set-key (kbd "C-c o") 'org-open-at-point-global)
(setq compile-command "time make -k")
(global-set-key [C-tab] 'company-complete)

(global-set-key (kbd "C-c p a") 'ag-project)
(global-set-key (kbd "C-c p A") 'ag-project-regexp)
(global-set-key (kbd "C-x y") 'kill-ring-ido)

(global-set-key (kbd "C-c c") 'projectile-compile-project)

(eval-after-load "minor-mode"
  (define-key projectile-mode-map (kbd "C-c p a") nil) ; originally: projectile-ack
)
(eval-after-load "minor-mode"
  (define-key projectile-mode-map (kbd "C-c p A") nil) ; originally: projectile-ack
)


(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c h") 'ff-find-other-file)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c C-c") 'comment-region)

(global-set-key (kbd "C-c d i") 'doxymacs-insert-file-comment)
(global-set-key (kbd "C-c d f") 'doxymacs-insert-function-comment)
(global-set-key (kbd "C-c d m") 'doxymacs-insert-member-comment)
(global-set-key (kbd "C-c c") 'projectile-compile-project)
