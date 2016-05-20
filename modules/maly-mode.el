;;; maly-mode.el --- Major mode for editing MALY files

;; Author: Stefan Schwarzburg
;; Version: 0.1

;;; Commentary:

;; This is a simple major mode for editing MALY files.
;; currently only syntax highlighting is supported

;; Put this file into your load-path and the following into your
;; ~/.emacs:
;; (require 'maly-mode)
;; (add-to-list 'auto-mode-alist '("\\.maly\\'" . maly-mode))


(defvar maly-mode-hook nil)

(defvar maly-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for MALY major mode")

;; autoload
(add-to-list 'auto-mode-alist '("\\.maly\\'" . maly-mode))


(defconst maly-font-lock-keywords-1
  (list
   '("\\<\\(BEGIN\\|END\\)\\>" . font-lock-builtin-face)
   ;;(regexp-opt '("MALY" "MASKSET" "CMASK" "MASK" "TITLE" "PARAMETER" "STRGROUP") t)
   '("\\<\\(\\(CMASK\\|MA\\(?:LY\\|SK\\(?:SET\\)?\\)\\|PARAMETER\\|STRGROUP\\|TITLE\\)\\)\\>" . font-lock-keyword-face)
   ;; (regexp-opt '("FONT" "MASKSIZE" "BASE" "ARYBASE" "ROOT NATIVE" "ROOT OASIS.MASK" "MASKMIRROR" "SREF" "AREF" "DATE" "SERIAL" "STRING" "REFERENCE TOOL" "SIZE" "ITERATION" "SCALE" "MIRROR" "ROTATE" "ORG") t)
   '("\\<\\(AR\\(?:EF\\|YBASE\\)\\|BASE\\|DATE\\|FONT\\|ITERATION\\|M\\(?:ASK\\(?:MIRROR\\|SIZE\\)\\|IRROR\\)\\|ORG\\|R\\(?:EFERENCE TOOL\\|O\\(?:OT \\(?:NATIVE\\|OASIS\\.MASK\\)\\|TATE\\)\\)\\|S\\(?:CALE\\|ERIAL\\|IZE\\|REF\\|TRING\\)\\)\\>" . font-lock-function-name-face)
   ;; (regexp-opt '("NATIVE" "STANDARD" "OFF" "NONE" "Y" "ORIGIN" "CENTER" "LOWERLEFT") t)
   '("\\<\\(CENTER\\|LOWERLEFT\\|N\\(?:\\(?:ATIV\\|ON\\)E\\)\\|O\\(?:FF\\|RIGIN\\)\\|STANDARD\\|Y\\)\\>" . font-lock-constant-face)
   '("BEGIN\\W?\\(?:MASK\\|STRGROUP\\)\\W?\\([A-Za-z0-9._]+\\b\\)" 1 font-lock-variable-name-face)
   )
  "Minimal highlighting expressions for MALY mode")

(defvar maly-font-lock-keywords maly-font-lock-keywords-1
  "Default highlighting expressions for MALY mode")


(defvar maly-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?. "w" st)
    (modify-syntax-entry ?/ ". 124b" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?\n "> b" st)
    st)
  "Syntax table for maly-mode")

(defun maly-mode ()
  "Major mode for editing maly files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table maly-mode-syntax-table)
  (use-local-map maly-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(maly-font-lock-keywords))
  ;;  (set (make-local-variable 'indent-line-function) 'maly-indent-line)
  (setq major-mode 'maly-mode)
  (setq mode-name "MALY")
  (run-hooks 'maly-mode-hook))

(provide 'maly-mode)
