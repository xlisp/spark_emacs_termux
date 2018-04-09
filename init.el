(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(windmove-default-keybindings)

(global-set-key
 (kbd "C-c C-o")
 (lambda ()
   (interactive)
   (save-buffers-kill-emacs)))

(defvar home-path "/data/data/com.termux/files/home/JIM_EMACS")
(load-file (concat home-path "/queue-0.2.el"))

(require 'helm-projectile)
(helm-projectile-on)

(defun h-find-file ()
  (interactive)
  (helm-projectile-find-file)
  )
(define-key global-map (kbd "C-p") 'h-find-file)

(add-to-list 'custom-theme-load-path (concat home-path "/themes/") )
(load-theme 'monokai t)

