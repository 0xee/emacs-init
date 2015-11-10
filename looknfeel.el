
;;; Look & feel
;(setq debug-on-quit t)

(tool-bar-mode 0)                 ; disable tool bar
(blink-cursor-mode 0)
(windmove-default-keybindings)    ; switch windows with shift-arrow
(fset 'yes-or-no-p 'y-or-n-p)     ; y/n instead of yes/no
(setq ring-bell-function 'ignore) ; no bell ringing
(set-keyboard-coding-system 'utf-8) ; use utf8 for input
(prefer-coding-system 'utf-8)
(setq column-number-mode t)
(show-paren-mode t)
(setq show-paren-style 'expression)
(ido-mode t)
(set-face-background 'show-paren-match-face "#382C2C")

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(global-set-key (kbd "C-x C-c") 'ask-before-closing)
(global-set-key (kbd "C-x b") 'ido-switch-buffer)

;; File management
(setq backup-inhibited t)         ; disable funny backup file
(setq create-lockfiles nil)         ; disable funny backup file
(setq auto-save-default nil)      ; disable auto-save feature



;; Colored compilation
(define-derived-mode ansi-compilation-mode compilation-mode "ansi compilation"
  "Compilation mode that understands ansi colors."
  (require 'ansi-color)
  (toggle-read-only 0)
  (ansi-color-apply-on-region (point-min) (point-max)))

(defun colorize-compilation (one two)
  "ansi colorize the compilation buffer."
  (ansi-compilation-mode)
 )

(setq compilation-finish-function 'colorize-compilation)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c l") 'ace-jump-line-mode)

(load-file "~/.emacs.d/el-get/zoom-window/zoom-window.el")
(define-key global-map (kbd "C-x z") 'zoom-window-zoom)

(require 'dedicated)
(define-key global-map (kbd "C-x d") 'dedicated-mode)

(winner-mode 1)


(global-set-key (kbd "<f12>")                                ;; switch to ...
  (lambda()(interactive)                                     ;; ... *scratch*
    (switch-to-buffer (get-buffer-create "*scratch*"))))

(defun my-projectile-hook ()
  (local-set-key (kbd "C-c p s") 'projectile-switch-project))

(set-frame-parameter nil 'unsplittable t)

(global-flycheck-mode)

(require 'flycheck-tip)

; TODO: make this work
(define-key flycheck-mode-map flycheck-keymap-prefix nil)
(setq flycheck-keymap-prefix (kbd "C-;"))
(define-key flycheck-mode-map flycheck-keymap-prefix
                flycheck-command-map)


(defun check-cpp()
  (interactive)
  (flycheck-compile (flycheck-get-checker-for-buffer))
)

(defun my-flycheck-hook ()
  (local-set-key (kbd "C-c C-n") 'flycheck-tip-cycle)
  (local-set-key (kbd "C-c C-p") 'flycheck-tip-cycle-reverse)
  (local-set-key (kbd "<f9>") 'check-cpp)
  )

(add-hook 'flycheck-mode-hook 'my-flycheck-hook)


(defun kill-on-quit-hook ()
  (local-set-key (kbd "q") (lambda () (interactive) (quit-window t)))
  )

(add-hook 'compilation-mode-hook 'kill-on-quit-hook)
(add-hook 'diff-mode-hook 'kill-on-quit-hook)

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x K") 'ido-kill-buffer)
