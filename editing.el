
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Global editing defaults

(setq-default indent-tabs-mode nil)

(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

(setq default-tab-width 4) ; tab-width is 4
(global-set-key (kbd "C-S-s") 'ioccur)


(setq global-highlight-changes-mode t)
(setq highlight-changes-visibility-initial-state nil)

(global-set-key [f6] 'highlight-changes-visible-mode)
(global-set-key [M-prior] 'highlight-changes-previous-change)
(global-set-key [M-next] 'highlight-changes-next-change)
