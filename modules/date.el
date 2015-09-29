
(defun insert-current-date () (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

(global-set-key "\C-x\M-d" 'insert-current-date)
