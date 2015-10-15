

(defun includeguard-sym-name ()
  (replace-regexp-in-string "[\\.-]" "_"
  (upcase (file-name-nondirectory (buffer-file-name)))))

(defun includeguard-generate () (interactive)
  (let ((ig-sym (includeguard-sym-name)))
    ;;(beginning-of-buffer)
    (end-of-buffer)
    (insert "\n#ifndef _" ig-sym "_\n")
    (insert "#define _" ig-sym "_\n\n")
    (insert "\n#endif /* _" ig-sym "_ */\n")))

(provide 'includeguards)
