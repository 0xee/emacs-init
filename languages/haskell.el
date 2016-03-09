


(require 'haskell-interactive-mode)
(require 'haskell-process)

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

;; (let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
;;   (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
;;   (add-to-list 'exec-path my-cabal-path))

;; (add-to-list 'load-path "~/.cabal/share/ghc-mod-5.0.1.2")

;; (autoload 'ghc-init "ghc" nil t)
;; (autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(add-hook 'haskell-mode-hook 'highlight-symbol-mode)


;(load-file "~/.emacs.d/el-get/hamlet-mode/hamlet-mode.el")
