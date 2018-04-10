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
  (helm-projectile-find-file))
(define-key global-map (kbd "C-p") 'h-find-file)

(add-to-list 'custom-theme-load-path (concat home-path "/themes/") )
(load-theme 'monokai t)

(global-set-key
 (kbd "C-c m")
 (lambda ()
   (interactive)
   (goto-char (point-max))))

(define-key global-map (kbd "C-c k") 'ido-kill-buffer)

(defun clj-eval-sexp (sexp)
  (interactive "sClJ-EVAL:")
  (cider-interactive-eval sexp))
(define-key global-map (kbd "M-\"") 'clj-eval-sexp)

(define-key global-map (kbd "C-l") 'cider-eval-last-sexp)
(global-set-key
 (kbd "C-n")
 (lambda ()
   (interactive)
   (clojure-forward-logical-sexp 1)))
(define-key global-map (kbd "M-g") 'goto-line)

(require 'helm)
(require 'helm-config)

(helm-mode 1)
(helm-autoresize-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-M-x-fuzzy-match                  t   ; 模糊搜索
      helm-buffers-fuzzy-matching           t
      helm-locate-fuzzy-match               t
      helm-recentf-fuzzy-match              t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)

(provide 'init-helm)

(define-key global-map (kbd "C-x C-g") 'helm-projectile-ag)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (helm-ag queue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond
   ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
   ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
   (t (self-insert-command (or arg 1)))))

(defun v ()
  (interactive)
  (find-file "/data/data/com.termux/files/home/spark_emacs_termux/init.el"))
