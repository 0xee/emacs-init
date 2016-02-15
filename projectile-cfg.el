
(require 'projectile)


(projectile-global-mode t)

(defun projectile-ag-regexp ()
  (interactive)
  (let ((current-prefix-arg '(4))) (call-interactively 'projectile-ag)))

(define-key projectile-mode-map (kbd "C-c p s") 'projectile-switch-project)
(define-key projectile-mode-map (kbd "C-c c") 'projectile-compile-project)
(define-key projectile-mode-map (kbd "C-c p a") 'projectile-ag)
(define-key projectile-mode-map (kbd "C-c p A") 'projectile-ag-regexp)



              ;; ("~/Desktop/"
              ;;  ("OrangeRed3" "OrangeRed4")
              ;;  "/home/lukas/emacs/"
              ;;  ("DarkOrange3" "DarkOrange4")
              ;;  "/home/shared/projects/hs-playground/blog/"
              ;;  ("DodgerBlue3" "DodgerBlue4")
              ;;  "/home/shared/projects/hs-playground/showinfo/"
              ;;  ("IndianRed3" "IndianRed4")
              ;;  "/home/shared/projects/hs-playground/portfolio/"
              ;;  ("SlateBlue3" "SlateBlue4")
              ;;  "/home/lukas/.emacs.d/elpa/restart-emacs-0.1.1/"
              ;;  ("DarkOrchid3" "DarkOrchid4")
              ;;  "/usr/share/info/"
              ;;  ("maroon3" "maroon4")))


(setq my-project-buffer-colors
  '(
    ("/home/lukas/emacs/" . ("OrangeRed3" "OrangeRed4"))
    ("/home/shared/projects/hs-playground/portfolio/" . ("DarkOrange3" "DarkOrange4"))
    ("/home/shared/projects/hs-playground/blog/" . ("DodgerBlue3" "DodgerBlue4"))
    ("/home/shared/projects/hs-playground/showinfo/" . ("IndianRed3" "IndianRed4"))
    )
)

(add-to-list 'my-project-buffer-colors '("/tmp/foo/" "PaleVioletRed3" "PaleVioletRed4"))

(defun apply-project-color ()
  (if (projectile-project-p)
      (progn
        (message "In project")
        (message (format "%s" my-project-buffer-colors))
        (let ((pr-colors (assoc (projectile-project-root) my-project-buffer-colors)))
          (message (format "%s" pr-colors))
          (when pr-colors
            (let ((colors (cdr pr-colors)))
              (message (format "%s" colors))
              (list (face-remap-add-relative 'mode-line (list :background (car colors)))
                    (face-remap-add-relative 'mode-line-inactive (list :background (cadr colors)))
                    )
              )
            )
          )
        )
    )
  )

(global-set-key (kbd "<f7>")
  (lambda()(interactive)
    (apply-project-color)))


;(remove-hook 'projectile-mode-hook 'assign-project-color)
;(add-hook 'projectile-mode-hook 'assign-project-color)







;; (defvar my-project-buffer-colors
;;   (let ((colors '(
;;                   ("OrangeRed3" "OrangeRed4")
;;                  ("DarkOrange3" "DarkOrange4")
;;                  ("DodgerBlue3" "DodgerBlue4")
;;                  ("IndianRed3" "IndianRed4")
;;                   ("SlateBlue3" "SlateBlue4")
;;                   ("DarkOrchid3" "DarkOrchid4")
;;                   ("maroon3" "maroon4")

;;                   )))
;;     (setcdr (last colors) colors)
;;     colors)
;;   "Cyclic list of color combos to use for project files.
;; Elements are in the form: (active-background-color inactive-background-color).")

;; (defvar my-assigned-project-colors (make-hash-table :test 'equal)
;;   "Hash table pairing project hosts to mode-line color overrides.")

;; (defvar-local my-assigned-project-color-cookies nil
;;   "Stores the face remap cookies created by `my-maybe-assign-project-color' for removal if necessary.")

;; (defun my-maybe-assign-project-color ()
;;   "If newly found file is project assign it new modeline colors.

;; Colors are taken from `my-project-buffer-colors', every file on the same project
;; host will have the same colors, each newly accessed project host will be assigned a new
;; color cycled from `my-project-buffer-colors'."
;;     (when (projectile-project-p)
;;       (let ((project (projectile-project-root)))
;;       (let ((color (or (gethash project my-assigned-project-colors)
;;                        (puthash project (pop my-project-buffer-colors) my-assigned-project-colors))))
;;         (setq my-assigned-project-color-cookies
;;               (list (face-remap-add-relative 'mode-line (list :background (car color)))
;;                     (face-remap-add-relative 'mode-line-inactive (list :background (cadr color)))))))))
