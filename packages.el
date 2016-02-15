
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Package management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'package-archives
         '("melpa" . "http://melpa-stable.milkbox.net/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get")
(require 'el-get)
;; (unless (require 'el-get nil t)
;;   (url-retrieve
;;    "http://raw.github.com/dimitri/el-get/master/el-get-install.el"
;;    (lambda (s)
;;      (end-of-buffer)
;;      (eval-print-last-sexp))))

(load-file "~/.emacs.d/el-get/hexrgb/hexrgb.el")
(load-file "~/.emacs.d/el-get/oneonone/oneonone.el")
