

(flycheck-define-checker cuda-nvcc
  "CUDA C++ checker"
  :command ("ssh" "gpublade01" "nvcc"
            "--cubin" "-O0"
            ;; "--compile"
            "-arch=sm_35"
            "--resource-usage"
            ;; "-fno-diagnostics-show-caret" ; Do not visually indicate the source location
            ;; "-fno-diagnostics-show-option" ; Do not show the corresponding
            ;;                             ; warning group
            ;; "-iquote" (eval (flycheck-c/c++-quoted-include-directory))
            ;; (option "-std=" flycheck-gcc-language-standard concat)
            ;; (option-flag "-pedantic" flycheck-gcc-pedantic)
            ;; (option-flag "-pedantic-errors" flycheck-gcc-pedantic-errors)
            ;; (option-flag "-fno-exceptions" flycheck-gcc-no-exceptions)
            ;; (option-flag "-fno-rtti" flycheck-gcc-no-rtti)
            ;; (option-flag "-fopenmp" flycheck-gcc-openmp)
            ;; (option-list "-include" flycheck-gcc-includes)
            ;; (option-list "-W" flycheck-gcc-warnings concat)
            ;; (option-list "-D" flycheck-gcc-definitions concat)
            ;; (option-list "-I" flycheck-gcc-include-path)
            ;; (eval flycheck-gcc-args)
            ;; "-x" (eval
            ;;       (pcase major-mode
            ;;         (`c++-mode "c++")
            ;;         (`c-mode "c")))
            source-inplace
            ;; ;; GCC performs full checking only when actually compiling, so
            ;; ;; `-fsyntax-only' is not enough. Just let it generate assembly
            ;; ;; code.
            ;; "-S"
            "-o" null-device)
  :error-patterns
  ((error line-start
          (message "In file included from") " " (file-name) ":" line ":"
          column ":"
          line-end)

   (info line-start (file-name) ":" line ":" column
         ": note: " (message) line-end)

   (warning line-start (file-name) "(" line "): warning: "
            (message) line-end)

   (error line-start (file-name) "(" line "): error: "
          (message) line-end)


   ;; (info line-start  "ptxas info    : Used" line " registers, " column
   ;;       " bytes cmem[0]" line-end)

   )

  :error-filter
  (lambda (errors)
    (flycheck-fold-include-levels (flycheck-sanitize-errors errors)
                                  "In file included from"))
  :modes (cuda-mode)
  ;; :next-checkers ((warning . c/c++-cppcheck))
  )

(add-to-list 'flycheck-checkers 'cuda-nvcc)
