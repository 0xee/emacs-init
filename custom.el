
(set-variable 'ag-arguments (quote ("--line-number" "--smart-case" "--column" "--nogroup")))
(set-variable 'ag-highlight-search t)
(set-variable 'ag-ignore-list (quote ("build/*" "*.ipynb" "core.*" "core")))
(set-variable 'ag-project-root-function (quote project-root-helper))
(set-variable 'ag-reuse-buffers t)
(set-variable 'blink-cursor-mode nil)
(set-variable 'c-syntactic-indentation t)
(set-variable 'c-tab-always-indent t)
(set-variable 'company-auto-complete (quote (quote company-explicit-action-p)))
(set-variable 'compilation-always-kill t)
(set-variable 'compilation-auto-jump-to-first-error nil)
(set-variable 'compilation-environment nil)
(set-variable 'compilation-scroll-output (quote first-error))
(set-variable 'compilation-search-path (quote (nil "/usr/bin/" "/opt/local/bin/")))
(set-variable 'compilation-skip-threshold 2)
(set-variable 'current-language-environment "UTF-8")
(set-variable 'delete-selection-mode nil)
(set-variable 'doc-view-continuous t)
(set-variable 'doxymacs-command-character "\\")
(set-variable 'ediff-custom-diff-options "-c  -w")
(set-variable 'ediff-diff-options "-w")
(set-variable 'ediff-split-window-function (quote split-window-horizontally))
(set-variable 'explicit-bash-args (quote ("--noediting" "-i")))
(set-variable 'explicit-shell-file-name nil)
(set-variable 'fill-column 79)
(set-variable 'flymake-gui-warnings-enabled nil)
(set-variable 'global-highlight-changes-mode t)
(set-variable 'highlight-changes-visibility-initial-state nil)
(set-variable 'ido-auto-merge-delay-time 10)
(set-variable 'ido-enter-matching-directory (quote only))
(set-variable 'ido-enable-flex-matching t)
(set-variable 'ido-everywhere t)
(set-variable 'ido-use-filename-at-point (quote guess))
(set-variable 'ido-use-url-at-point t)
(set-variable 'indent-tabs-mode nil)
(set-variable 'ispell-dictionary "deutsch")
(set-variable 'ispell-extra-args nil)
(set-variable 'ispell-program-name "/usr/bin/aspell")
(set-variable 'load-home-init-file t t)
(set-variable 'mark-even-if-inactive t)
(set-variable 'preview-gs-command "/opt/local/bin/gs")
(set-variable 'projectile-bzr-command "true")
(set-variable 'projectile-darcs-command "true")
(set-variable 'projectile-enable-caching t)
(set-variable 'projectile-git-command "true")
(set-variable 'projectile-hg-command "true")
(set-variable 'projectile-indexing-method (quote native))
(set-variable 'projectile-project-root-files (quote ("rebar.config" "project.clj" "pom.xml" "build.sbt" "build.gradle" "Gemfile" "requirements.txt" "package.json" "gulpfile.js" "Gruntfile.js" "bower.json" "composer.json" "SConstruct" "lastPerformance.pdf" "run.log")))
(set-variable 'projectile-project-root-files-bottom-up (quote (".projectile" ".git" ".hg" ".fslckout" ".bzr" "_darcs" "SConstruct" "setup.py")))
(set-variable 'projectile-project-root-files-top-down-recurring (quote ("CVS" "SConscript")))
(set-variable 'ps-paper-type (quote a4))
(set-variable 'ps-print-color-p nil)
(set-variable 'recentf-initialize-file-name-history t)
(set-variable 'recentf-max-saved-items 8)
(set-variable 'recentf-mode t)
(set-variable 'reftex-plug-into-AUCTeX t)
(set-variable 'safe-local-variable-values (quote ((emacs-lisp-docstring-fill-column . 75))))
(set-variable 'scroll-bar-mode (quote right))
(set-variable 'semantic-c-dependency-system-include-path (quote ("/usr/include")))
(set-variable 'semantic-decoration-styles (quote (("semantic-decoration-on-includes" . t) ("semantic-decoration-on-protected-members" . t) ("semantic-decoration-on-private-members" . t) ("semantic-tag-boundary" . t))))
(set-variable 'semantic-idle-scheduler-idle-time 1)
(set-variable 'semantic-idle-scheduler-work-idle-time 60)
                                        ; (set-variable 'show-paren-mode t nil (paren))
(set-variable 'transient-mark-mode 1)
(set-variable 'user-full-name "Lukas Schuller")
(set-variable 'visible-cursor nil)
(set-variable 'void-text-area-pointer (quote arrow))


(set-face-foreground 'ido-subdir "ccaa8f")
(set-face-foreground 'ido-only-match "ForestGreen")
(set-face-foreground 'error "firebrick2")
(set-face-foreground 'compilation-info "#cae682")
(set-face-background 'cursor "gray50")
