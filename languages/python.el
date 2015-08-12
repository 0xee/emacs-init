

(setq auto-mode-alist(cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist(cons '("SConscript" . python-mode) auto-mode-alist))


(defun my-pymacs-saver ()
  (if (equal (buffer-name) "*Pymacs*")
      (yes-or-no-p "Really kill *Pymacs* buffer? ")
    t))

(add-hook 'kill-buffer-query-functions 'my-pymacs-saver)
