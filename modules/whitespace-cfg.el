;; Whitespace mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(windmove-default-keybindings)
(fset 'yes-or-no-p 'y-or-n-p)

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length

(setq whitespace-style '(face tabs trailing lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)
