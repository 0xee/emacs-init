;; Whitespace mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(windmove-default-keybindings)
(fset 'yes-or-no-p 'y-or-n-p)

(require 'whitespace)
(setq whitespace-line-column 79) ;; limit line length

(setq whitespace-style '(face tabs trailing lines-tail))

(defun my-ws-mode-hook ()
  (set-variable 'indent-tabs-mode nil)
  (whitespace-mode)
)
(add-hook 'prog-mode-hook 'my-ws-mode-hook)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)
