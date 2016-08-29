
(defun lock-window ()
  "Prevent Emacs from messing with the current window."
  (interactive)
  (set-window-dedicated-p (frame-selected-window) t)
  (message "Locked window."))

(defun ide2 ()
  "Set up a simple IDE-like environment."
  (interactive)
  (flycheck-list-errors)
  (compile "true")
  (delete-other-windows)
  (split-window-vertically -12)
  (other-window 1)
  (switch-to-buffer "*compilation*")
  (lock-window)
  (split-window-horizontally)
  (other-window 1)
  (switch-to-buffer "*Flycheck errors*")
  (lock-window)
  (other-window 1)
  (split-window-horizontally)
; Make sure we can get back here if our setup somehow gets messed up (use 'C-x r j i')
  (window-configuration-to-register ?i)
)

(defun ide3 ()
  "Set up a simple IDE-like environment."
  (interactive)
  (flycheck-list-errors)
  (compile "true")
  (delete-other-windows)
  (split-window-horizontally 107)
  (other-window 1)

  (split-window-horizontally 107)
  (other-window 1)
  (split-window-vertically)
  (switch-to-buffer "*Flycheck errors*")
  (lock-window)
  (other-window 1)
  (switch-to-buffer "*compilation*")
  (lock-window)
; Make sure we can get back here if our setup somehow gets messed up (use 'C-x r j i')
  (window-configuration-to-register ?i)
  )

(defun ide4 ()
  "Set up a simple IDE-like environment."
  (interactive)
  (flycheck-list-errors)
  (compile "true")
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (other-window 2)
  (split-window-horizontally 90)
  (split-window-vertically 20)
  (switch-to-buffer "*Flycheck errors*")
  (lock-window)
  (other-window 1)
  (split-window-vertically)
  (switch-to-buffer "*compilation*")
  (lock-window)
  (other-window 1)
  (switch-to-buffer "*scratch*")
  (if (eq nil (get-buffer "*Python*"))
      (run-python "/usr/bin/ipython -i"))
  (switch-to-buffer "*Python*")
  (lock-window)
  (other-window 1)
  (switch-to-buffer "*scratch*")
  (if (get-buffer "Gnome-terminal")
      (switch-to-buffer "Gnome-terminal"))
  (lock-window)
;  (other-window 1)
; Make sure we can get back here if our setup somehow gets messed up (use 'C-x r j i')
  (window-configuration-to-register ?i)
  )
