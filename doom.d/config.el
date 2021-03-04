;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq fancy-splash-image "~/dotfiles-local/doom.d/lucky_256x256.png")
(setq doom-font (font-spec :family "Operator Mono" :size 13))
(when (eq system-type 'darwin)
  (setq ns-pop-up-frames nil)
  (setq mac-right-option-modifier 'none))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil-escape)))
 (setq-default evil-escape-key-sequence "fd")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'default-frame-alist '(ns-appearance . dark))
