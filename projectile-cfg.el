
(package-require 'projectile)


(projectile-global-mode t)

(defun projectile-ag-regexp ()
  (interactive)
  (let ((current-prefix-arg '(4))) (call-interactively 'projectile-ag)))

(define-key projectile-mode-map (kbd "C-c p s") 'projectile-switch-project)
(define-key projectile-mode-map (kbd "C-c c") 'projectile-compile-project)
(define-key projectile-mode-map (kbd "C-c p a") 'projectile-ag)
(define-key projectile-mode-map (kbd "C-c p A") 'projectile-ag-regexp)


(defun project-color ()
  (if (projectile-project-p)
      (cdr (assoc (projectile-project-root) my-project-buffer-colors)))
  )

(setq projectile-mode-line '(:eval (list " "
 (propertize
    (concat "["
            (projectile-project-name)
            "]")
  'face
  (plist-put () :background (project-color))
  'help-echo
  (buffer-file-name)))))


;; This is needed to avoid slowdown when working with remote files.
(defadvice projectile-project-root (around ignore-remote first activate)
    (unless (file-remote-p default-directory) ad-do-it))
