
(defun find-alternative-file-with-sudo ()
  "Open current buffer as root!"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
 	     buffer-file-name))))

(provide 'find-alternative)
