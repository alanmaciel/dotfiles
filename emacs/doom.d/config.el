;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq user-full-name "Alan Maciel"
      user-mail-address "alan.maciel.salcedo@gmail.com")
(setq fancy-splash-image "~/dotfiles-local/emacs/doom.d/lucky_256x256.png")
;; (setq doom-font (font-spec :family "Operator Mono"
;;                            :weight 'Light
;;                            ;; :bold nil
;;                            :antialias nil
;;                            :size 12))
(setq doom-font (font-spec :family "JetBrains Mono NL"
                           :size 12))
;; (setq doom-font (font-spec :family "Victor Mono"
;;                            :size 12))
(custom-set-faces!
  '(font-lock-comment-face :slant italic))
  ;; '(font-lock-keyword-face :slant italic))
(setq-default evil-escape-key-sequence "fd")
;; (set-frame-parameter nil 'alpha 98)
(setq mode-line-format
      (list
       '(:eval (list (nyan-create)))
       ))
;; (setq doom-theme 'doom-sourcerer)
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-spacegrey)
(setq mode-line-format
      (list
       '(:eval (list (nyan-create)))
       ))
;; (setq doom-theme 'spacemacs-light)
(when (eq system-type 'darwin)
  (setq ns-pop-up-frames nil)
  (setq mac-right-option-modifier 'none)
  (setq doom-fallback-buffer-name "emacs"
        +doom-dashboard-name "emacs")
  (setq-default frame-title-format '("%b")))
(when (daemonp)
  (exec-path-from-shell-initialize))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   (perl . t)
   (js . t)
   (shell . t)
   (sql . t)
   (org . t)
   (emacs-lisp . t)
   (lisp . t)    ;; slime - lisp interaction mode
   (gnuplot . t)))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'exec-path "/usr/local/opt/mysql-client/bin")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil-escape)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
