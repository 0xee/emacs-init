
(require 'projectile)


(projectile-global-mode t)

(define-key projectile-mode-map (kbd "C-c p s") 'projectile-switch-project)
(define-key projectile-mode-map (kbd "C-c c") 'projectile-compile-project)
(define-key projectile-mode-map (kbd "C-c p a") 'ag-project)
(define-key projectile-mode-map (kbd "C-c p A") 'ag-project-regexp)
