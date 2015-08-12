(defun includeguard-sym-name ()
  (replace-in-string (upcase (file-name-nondirectory (buffer-file-name)))
					 "[\\.-]" "_"))

(defun includeguard-generate () (interactive)
  (if  (string= (file-name-extension (buffer-file-name)) "h") 
  (let ((ig-sym (includeguard-sym-name)))
    ;;(beginning-of-buffer)
    (end-of-buffer)
    (insert "\n#ifndef " ig-sym "\n")
    (insert "#define " ig-sym "\n\n")
    (insert "\n#endif /* " ig-sym " */\n"))))

(provide 'includeguards)
