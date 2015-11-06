
(require 'projectile)


(projectile-global-mode t)

(defun projectile-ag-regexp ()
  (interactive)
  (let ((current-prefix-arg '(4))) (call-interactively 'projectile-ag)))

(define-key projectile-mode-map (kbd "C-c p s") 'projectile-switch-project)
(define-key projectile-mode-map (kbd "C-c c") 'projectile-compile-project)
(define-key projectile-mode-map (kbd "C-c p a") 'projectile-ag)
(define-key projectile-mode-map (kbd "C-c p A") 'projectile-ag-regexp)
