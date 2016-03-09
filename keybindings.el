
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Global keybindings
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "M-#") 'quick-calc)
(global-set-key (kbd "C-c o") 'org-open-at-point-global)
(setq compile-command "time make -k")
(global-set-key [C-tab] 'company-complete)

(global-set-key (kbd "C-x y") 'kill-ring-ido)


(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c h") 'ff-find-other-file)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c C-c") 'comment-region)

(global-set-key (kbd "C-c d i") 'doxymacs-insert-file-comment)
(global-set-key (kbd "C-c d f") 'doxymacs-insert-function-comment)
(global-set-key (kbd "C-c d m") 'doxymacs-insert-member-comment)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key [M-S-up] 'enlarge-window)
(global-set-key [M-S-down] (lambda () (interactive) (enlarge-window -1)))

(global-set-key [M-S-right] 'enlarge-window-horizontally)
(global-set-key [M-S-left] (lambda () (interactive) (enlarge-window-horizontally -1)))

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
