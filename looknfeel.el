
;;; Look & feel

(tool-bar-mode 0)                 ; disable tool bar
(blink-cursor-mode 0)
(windmove-default-keybindings)    ; switch windows with shift-arrow
(fset 'yes-or-no-p 'y-or-n-p)     ; y/n instead of yes/no
(setq ring-bell-function 'ignore) ; no bell ringing
(set-keyboard-coding-system 'utf-8) ; use utf8 for input
(prefer-coding-system 'utf-8)
(setq column-number-mode t)

(ido-mode t)

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
