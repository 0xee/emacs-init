

(setq auto-mode-alist(cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist(cons '("SConscript" . python-mode) auto-mode-alist))


(defun my-pymacs-saver ()
  (if (equal (buffer-name) "*Pymacs*")
      (yes-or-no-p "Really kill *Pymacs* buffer? ")
    t))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  (local-set-key (kbd "C-c C-c") 'comment-region)
  (local-set-key (kbd "C-c C-d") 'c-hungry-delete-forward)
  (local-set-key (kbd "C-c C-r") 'python-shell-send-buffer)
  (local-set-key (kbd "C-c z") 'jedi:goto-definition)
  (jedi-mode)
  )

(add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'kill-buffer-query-functions 'my-pymacs-saver)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-shell-name "ipython")
;(setq python-shell-interpreter "build/arch-pc/sandbox")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; (setq py-force-py-shell-name-p t)

;; ; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ; try to automagically figure out indentation
;; (setq py-smart-indentation t)

;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;      ; Make sure it's not a remote buffer or flymake would not work
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                          'flymake-create-temp-inplace))
;;              (local-file (file-relative-name
;;                           temp-file
;;                           (file-name-directory buffer-file-name))))
;;         (list "pyflakes" (list local-file)))
;;     )
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))
