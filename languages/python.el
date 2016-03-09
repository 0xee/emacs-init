

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
  (highlight-symbol-mode t)
  )

(add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'kill-buffer-query-functions 'my-pymacs-saver)

; use IPython
(setq-default py-shell-name "ipython")
