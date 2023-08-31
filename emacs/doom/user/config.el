(setq user-full-name "Alan Maciel"
      user-mail-address "alan.maciel.salcedo@gmail.com")

(setq projectile-project-search-path '("~/Projects" "~/Study"))

;; (setq dashboard-startup-banner nil)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-banner)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
;; (setq fancy-splash-image (concat doom-private-dir "splash.png"))
;; (setq fancy-splash-image "~/dotfiles-local/emacs/doom.d/splash/emacs.png")
;; (setq fancy-splash-image "~/dotfiles-local/emacs/doom.d/splash/lucky-doom-emacs-color.png")
;; (setq fancy-splash-image "~/dotfiles-local/emacs/doom.d/splash/fa1983dd4f50bb1b12eb3ada8f020a2e.png")
;; (setq fancy-splash-image "~/dotfiles-local/emacs/doom.d/splash/eeb1668a976d83fcb0543ca55dc87be0.png")
;; (setq fancy-splash-image "~/dotfiles-local/emacs/doom.d/splash/e6d42358cc42033ae34b07cb90bc46d2.png")
;; (setq fancy-splash-image "~/dotfiles-local/emacs/doom.d/splash/81558554-cbf53680-9385-11ea-8db6-2dc6abe0c1ae.png")

(setq doom-theme 'doom-wilmersdorf
      doom-themes-treemacs-enable-variable-pitch nil)
;; (setq doom-theme 'doom-gruvbox
;;       doom-themes-treemacs-enable-variable-pitch nil)
;; spacemacs-light, doom-nord-light, doom-gruvbox-light,
;; (setq doom-theme 'doom-oceanic-next
;;        doom-themes-treemacs-enable-variable-pitch nil)
;; (setq doom-theme 'doom-nord-light
;;        doom-themes-treemacs-enable-variable-pitch nil)
;; (setq doom-theme 'doom-tokyo-night
;;        doom-themes-treemacs-enable-variable-pitch nil)
;; (setq doom-theme 'jetbrains-darcula
;;        doom-themes-treemacs-enable-variable-pitch nil)
;;(setq doom-theme 'doom-zenburn
;;        doom-themes-treemacs-enable-variable-pitch nil)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'twilight t)
;; (setq doom-theme 'twilight)

;; For day:
;; spacemacs-light, doom-nord-light, doom-gruvbox-light,
;; For night:
;; doom-dracula, doom-gruvbox, doom-sourcerer, doom-spacegray, doom-vibrant
;; doom-oceanic-next, doom-laserwave
;; (defun y/auto-update-theme ()
;;   "depending on time use different theme"
;;   ;; very early => gruvbox-light, solarized-light, nord-light
;;   (let* ((hour (nth 2 (decode-time (current-time))))
;;          (theme (cond ((<= 7 hour 8)   'doom-gruvbox-light)
;;                       ((= 9 hour)      'spacemacs-light)
;;                       ((<= 10 hour 16) 'doom-nord-light)
;;                       ((<= 17 hour 18) 'doom-gruvbox-light)
;;                       ((<= 19 hour 22) 'doom-oceanic-next)
;;                       (t               'doom-laserwave))))
;;     (when (not (equal doom-theme theme))
;;       (setq doom-theme theme)
;;       (load-theme doom-theme t))
;;     ;; run that function again next hour
;;     (run-at-time (format "%02d:%02d" (+ hour 1) 0) nil 'y/auto-update-theme)))

(setq doom-font (font-spec :family "Menlo" :size 12 :weight 'regular) ;; You can change to regular if you prefer
      doom-big-font (font-spec :family "Operator Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 12)
      doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font" :size 11)
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

;; (setq doom-font (font-spec :family "JetBrains Mono" :size 13 :weight 'bold) ;; You can change to regular if you prefer
;;       doom-big-font (font-spec :family "Operator Mono" :size 18)
;;       doom-variable-pitch-font (font-spec :family "Overpass" :size 12)
;;       doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font" :size 11)
;;       doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

;; (setq doom-font (font-spec :family "Operator Mono" :size 13) ;; You can change to regular if you prefer
;;       doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 13)
;;       doom-variable-pitch-font (font-spec :family "Overpass" :size 12)
;;       doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font" :size 11)
;;       doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

;; (when (doom-font-exists-p "Iosevka Custom")
;;     (setq doom-font                (font-spec :name "Iosevka Custom" :size 14)))
;; (when (doom-font-exists-p "Alegreya Sans")
;;     (setq doom-variable-pitch-font (font-spec :name "Alegreya Sans"  :size 16)))
;; (when (doom-font-exists-p "Noto Color Emoji")
;;     (setq doom-unicode-font        (font-spec :name "Noto Color Emoji")))

(use-package! doom-modeline
  :config
  (setq doom-modeline-persp-name t))

(setq doom-modeline-height 35)

(beacon-mode 1)

(setq minimap-window-location 'right)
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap-mode" "M" #'minimap-mode))

(custom-set-faces!
  '(font-lock-comment-face :slant italic))

(setq display-line-numbers-type t)

(setq default-frame-alist '((width . 115)(height . 34)))
;; (add-to-list 'initial-frame-alist '(width . 92))
;; (add-to-list 'initial-frame-alist '(height . 40))

;; (add-to-list 'default-frame-alist '(width . 92))
;; (add-to-list 'default-frame-alist '(height . 40))

; (add-to-list 'default-frame-alist '(alpha-background . 50))
(add-to-list 'default-frame-alist '(alpha . 95))

;; (add-to-list 'default-frame-alist '(undecorated-round . t))
;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
;; (add-to-list 'default-frame-alist '(undecorated . t))
;; (add-to-list 'default-frame-alist '(drag-internal-border . 1))
;; (add-to-list 'default-frame-alist '(internal-border-width . 5))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; (setq rbenv-executable "/usr/local/opt/rbenv/bin/rbenv") ;; Rosetta (intel emulation)
;; (setq rbenv-executable "/opt/homebrew/bin/rbenv") ;; Arm (normal brew)

;; (require 'asdf-vm)
;; (asdf-vm-init)

(pixel-scroll-precision-mode nil)

(setq-default abbrev-mode t)

;; (use-package! olivetti
;;  :config
;;  (setq-default olivetti-body-width 130)
;;  (add-hook 'mixed-pitch-mode-hook  (lambda () (setq-local olivetti-body-width 70))))

;; (use-package! auto-olivetti
;;  :custom
;;  (auto-olivetti-enabled-modes '(text-mode prog-mode helpful-mode))
;;  :config
;;  (auto-olivetti-mode))

(use-package! diff-hl
  :config
  (custom-set-faces!
    `((diff-hl-change)
      :foreground ,(doom-blend (doom-color 'bg) (doom-color 'blue) 0.5))
    `((diff-hl-insert)
      :foreground ,(doom-blend (doom-color 'bg) (doom-color 'green) 0.5)))
)

(use-package! evil-escape
  :config
  (setq evil-esc-delay 0.25))

(use-package! evil-vimish-fold
  :config
  (global-evil-vimish-fold-mode))

(use-package! evil-goggles
  :init
  (setq evil-goggles-enable-change t
        evil-goggles-enable-delete t
        evil-goggles-pulse         t
        evil-goggles-duration      0.25)
  :config
  (custom-set-faces!
    `((evil-goggles-yank-face evil-goggles-surround-face)
      :background ,(doom-blend (doom-color 'blue) (doom-color 'bg-alt) 0.5)
      :extend t)
    `(evil-goggles-paste-face
      :background ,(doom-blend (doom-color 'green) (doom-color 'bg-alt) 0.5)
      :extend t)
    `(evil-goggles-delete-face
      :background ,(doom-blend (doom-color 'red) (doom-color 'bg-alt) 0.5)
      :extend t)
    `(evil-goggles-change-face
      :background ,(doom-blend (doom-color 'orange) (doom-color 'bg-alt) 0.5)
      :extend t)
    `(evil-goggles-commentary-face
      :background ,(doom-blend (doom-color 'grey) (doom-color 'bg-alt) 0.5)
      :extend t)
    `((evil-goggles-indent-face evil-goggles-join-face evil-goggles-shift-face)
      :background ,(doom-blend (doom-color 'yellow) (doom-color 'bg-alt) 0.25)
      :extend t)
    ))

(setq corfu-auto-delay 0.5)

(use-package! corfu
  :config
  (defun corfu-enable-in-minibuffer ()
    "Enable Corfu in the minibuffer if `completion-at-point' is bound."
    (when (where-is-internal #'completion-at-point (list (current-local-map)))
      ;; (setq-local corfu-auto nil) ;; Enable/disable auto completion
      (setq-local corfu-echo-delay nil ;; Disable automatic echo and popup
                  corfu-popupinfo-delay nil)
      (corfu-mode 1)))
  (add-hook 'minibuffer-setup-hook #'corfu-enable-in-minibuffer))

(use-package! orderless
  :config
  (add-to-list 'orderless-matching-styles 'char-fold-to-regexp))

(custom-set-faces! '((corfu-popupinfo) :height 0.9))

;; (use-package! cape-yasnippet
;;   :after (corfu yasnippet)
;;   :init
;;   (add-to-list 'completion-at-point-functions #'cape-yasnippet))

(use-package! lsp-ui
  :config
  (setq lsp-ui-doc-delay 2
        lsp-ui-doc-max-width 80)
  (setq lsp-signature-function 'lsp-signature-posframe))

(use-package! yasnippet
  :config
  ;; It will test whether it can expand, if yes, change cursor color
  (defun hp/change-cursor-color-if-yasnippet-can-fire (&optional field)
    (interactive)
    (setq yas--condition-cache-timestamp (current-time))
    (let (templates-and-pos)
      (unless (and yas-expand-only-for-last-commands
                   (not (member last-command yas-expand-only-for-last-commands)))
        (setq templates-and-pos (if field
                                    (save-restriction
                                      (narrow-to-region (yas--field-start field)
                                                        (yas--field-end field))
                                      (yas--templates-for-key-at-point))
                                  (yas--templates-for-key-at-point))))
      (set-cursor-color (if (and templates-and-pos (first templates-and-pos)
                                 (eq evil-state 'insert))
                            (doom-color 'red)
                          (face-attribute 'default :foreground)))))
  :hook (post-command . hp/change-cursor-color-if-yasnippet-can-fire))

(require 'key-chord)
(key-chord-mode t)
(key-chord-define-global "ue" 'evil-normal-state) ;; in DVORAK
(key-chord-define-global "UE" 'evil-normal-state) ;; in DVORAK
(key-chord-define-global "fd" 'evil-normal-state) ;; in QWERTY
(key-chord-define-global "FD" 'evil-normal-state) ;; in QWERTY

(require 'which-key)
(which-key-mode)
;; (which-key-setup-side-window-bottom)
(after! which-key
  ;;                         | Name              | command                      | Keybinding |
  (+add-command-to-term-list '("Docker Compose" . "docker-compose up") "u") ;; SPC j u

  ;; Example asking something
  (+add-command-to-term-list '("Add Yarn Package" . (concat "yarn add " (read-string "Package name: "))) "ya") ;; SPC j y a

  ;; Example of dynamic command (using buffer name as example)
  (+add-command-to-term-list '("Rspec on file" . (concat "bundle exec rspec " (buffer-file-name))) "sv") ;; SPC j s v
  (+add-command-to-term-list '("Rspec on line" . (concat "bundle exec rspec " (buffer-file-name) ":" (format "%s" (line-number-at-pos)))) "ss") ;; SPC j s s

  ;; Getting text and executing a command
  (+add-command-to-term-list '("Brownie Test" . (concat "brownie test -k " (save-excursion (search-backward "def test_") (forward-word 2) (thing-at-point 'symbol t)))) "bt") ;; SPC j b t

  ;; Running scripts of a specific folder
  (+add-command-to-term-list '("Brownie Run Script" . (concat "brownie run " (read-file-name "scripts/") " " (read-string "Extra parameters: " nil "commands"))) "br") ;; SPC j b r

  ;; Creating terminal layouts: SPC T
  ;; It will create a new workspace with all terminals listed
  ;;                         | Layout Name    | Commands to execute                |
  (+add-layout-to-term-list '("Rails" . '("rails console" "rails server" nil)))
  (+add-layout-to-term-list '("React" . '("yarn start" nil)))
  (+add-layout-to-term-list '("Next JS" . '("yarn dev" "cowsay 'Have an nice work'" nil)))
  )

(setq harpoon-separate-by-branch nil)

(after! projectile
  (setq projectile-globally-ignored-directories '("flow-typed" "node_modules" "~/.config/emacs/.local/" ".idea" ".vscode" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".ccls-cache" ".cache" ".clangd")))

(after! projectile-rails
  (doom-emacs-on-rails-add-custom-projectile-finder "services" "app/services/"  "\\(.+\\)\\.rb$" "app/services/${filename}.rb" "rt")
  (doom-emacs-on-rails-add-custom-projectile-finder "admin" "app/admin/"  "\\(.+\\)\\.rb$" "app/admin/${filename}.rb" "rt")
  (doom-emacs-on-rails-add-custom-projectile-finder "contracts" "app/contracts/"  "\\(.+\\)\\.rb$" "app/contracts/${filename}.rb" "rq"))

(setq js-indent-level 2)
(setq ts-indent-level 2)
(setq typescript-indent-level 2)
(setq ruby-indent-level 2)
(setq standard-indent 2)

(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "es-MX")

;; (setq rubocop-on-current-file-command "bundle exec rubocop -A ") ;; SPC =

;; (add-hook 'ruby-mode-hook
;;  (lambda ()
;;    (setq-local flychech-checker nil)
;;    (setq-local flycheck-disabled-checkers '(ruby-reek lsp ruby-rubylint ruby-rubocop))) 1000)

(use-package eglot
  :config
  (setq eglot-events-buffer-size 0
        eglot-ignored-server-capabilities '(:inlayHintProvider)
        eglot-confirm-server-initiated-edits nil))

(use-package rustic
  :config
  ; Tell rustic where to find the cargo binary
  (setq rustic-cargo-bin-remote "/usr/local/cargo/bin/cargo")
  (setq rustic-lsp-client 'eglot))

;; (use-package lsp-mode
;;   :ensure t
;;   :commands lsp lsp-deferred
;;   :hook (;; hooks for all modes for which I want to setup lsp
;;          (python-mode . lsp)
;;          ;; which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :config
;;   (progn
;;     (add-hook 'prog-mode-hook #'lsp)
;;     (lsp-register-client
;;      (make-lsp-client :new-connection (lsp-tramp-connection "/opt/conda/bin/pyls")
;;                       :major-modes '(python-mode)
;;                       :remote? t
;;                       :server-id 'pyls-remote))))

;; (use-minitest "_test")

;; (after! lsp-mode
;;   (setq lsp-disabled-clients '(ruby-ls solargraph))
;;   (setq lsp-sorbet-use-bundler t))

(setq warning-minimum-level :emergency)

(after! projectile
  (defun open-projectile-with-magit (&optional DIRECTORY CACHE)
    (interactive)
    (magit-status DIRECTORY)
    (if (fboundp 'magit-fetch-from-upstream)
        (call-interactively #'magit-fetch-from-upstream)
      (call-interactively #'magit-fetch-current)))
  (setq +workspaces-switch-project-function #'open-projectile-with-magit))

;; (after! projectile-rails
;;   ;; Example: switch from app/contracts/{resource}.rb to app/services/{resource} and vice-versa
;;   (defun projectile-rails-find-contract ()
;;     "Switch from contract to service and vice versa."
;;     (interactive)
;;     (if (string-match-p "app/contracts" (buffer-file-name)) (find-file (replace-regexp-in-string "contract" "service" (replace-regexp-in-string "_contracts" "_services" (buffer-file-name))))
;;       (find-file (replace-regexp-in-string "service" "contract" (replace-regexp-in-string "_services" "_contracts" (buffer-file-name))))))
;;   (map! :leader "rQ" #'projectile-rails-find-contract) ;; Uncomment to bind to SPC r q
;;   )

;; (load (expand-file-name "modules/docker.el" doom-user-dir))

;; (setq ruby-docker-compose-command "docker-compose") ;; You docker-compose command (tip: you can use "cd ../; docker-compose")
;; (setq ruby-docker-rails-server-command "up") ;' To start rails server with SPC r R (docker-compose is implicit)
;; (setq ruby-docker-rails-console-command "run {{container}} rails console") ;; to start rails console (docker-compose is implicit)

;; (setq ruby-docker-rubocop-command "run {{container}} rubocop -a ") ;; Command to run rubocop on current file with SPC =
;; (setq ruby-docker-compose-cwd "/app/")
;; (setq ruby-docker-compose-container "web")

;; Tip here:  You can use M-x rbenv-use and select one version that has solargraph.  You can also install with apt or brew.
;; (setq ruby-docker-disable-solargraph nil) ;; If you want to disable solargraph, change to t.  PS:  You can use solargraph by removing .ruby-version of your project and using from rbenv.
;; (use-ruby-docker)
;;
;; End Docker

(setq-hook! 'rjsx-mode-hook +format-with 'prettier)
(setq-hook! 'typescript-tsx-mode-hook +format-with 'prettier)
(setq-hook! 'typescript-mode-hook +format-with 'prettier)

;; (map! :leader
;;       ;; (:prefix ("d" . "dired")
;;       ;;  :desc "Open dired" "d" #'dired
;;       ;;  :desc "Dired jump to current" "j" #'dired-jump)
;;       (:after dired
;;        (:map dired-mode-map
;;         :desc "Peep-dired image previews" "f v" #'peep-dired
;;         :desc "Dired view file" "f V" #'dired-view-file)))

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-do-chmod
  (kbd "O") 'dired-do-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-do-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-up-directory
  (kbd "% l") 'dired-downcase
  (kbd "% u") 'dired-upcase
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(after! org
  (setq org-directory "~/org/")
  (setq org-agenda-files '("~/org/agenda.org"))
  (setq org-log-done 'time )
  (setq org-log-done 'note )
  )

(after! org
  ;; Set some faces
  (custom-set-faces!
    `((org-quote)
      :foreground ,(doom-color 'blue) :extend t)
    `((org-block-begin-line org-block-end-line)
      :background ,(doom-color 'bg)))
  ;; Change how LaTeX and image previews are shown
  (setq org-highlight-latex-and-related '(native entities script)
        org-image-actual-width (min (/ (display-pixel-width) 3) 800)))

(after! org-mode
  (custom-set-faces!
    `((org-document-title)
      :foreground ,(face-attribute 'org-document-title :foreground)
      :height 1.3 :weight bold)
    `((org-level-1)
      :foreground ,(face-attribute 'outline-1 :foreground)
      :height 1.1 :weight medium)
    `((org-level-2)
      :foreground ,(face-attribute 'outline-2 :foreground)
      :weight medium)
    `((org-level-3)
      :foreground ,(face-attribute 'outline-3 :foreground)
      :weight medium)
    `((org-level-4)
      :foreground ,(face-attribute 'outline-4 :foreground)
      :weight medium)
    `((org-level-5)
      :foreground ,(face-attribute 'outline-5 :foreground)
      :weight medium)))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-hook 'text-mode-hook (lambda () (hl-line-mode -1)))

(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq
   ;; Edit settings
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   ;; Appearance
   org-modern-radio-target    '("❰" t "❱")
   org-modern-internal-target '("↪ " t "")
   org-modern-todo nil
   org-modern-tag nil
   org-modern-timestamp t
   org-modern-statistics nil
   org-modern-progress nil
   org-modern-priority nil
   org-modern-horizontal-rule "──────────"
   org-modern-hide-stars "·"
   org-modern-star ["⁖"]
   org-modern-keyword "‣"
   org-modern-list '((43 . "•")
                     (45 . "–")
                     (42 . "↪")))
  (custom-set-faces!
    `((org-modern-tag)
      :background ,(doom-blend (doom-color 'blue) (doom-color 'bg) 0.1)
      :foreground ,(doom-color 'grey))
    `((org-modern-radio-target org-modern-internal-target)
      :inherit 'default :foreground ,(doom-color 'blue)))
  )

;; (use-package! org-appear
;;   :hook
;;   (org-mode . org-appear-mode)
;;   :config
;;   (setq org-hide-emphasis-markers t
;;         org-appear-autolinks 'just-brackets))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/RoamNotes"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)
         ("C-M-i" . completion-at-point))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(setq frame-title-format
      '(""
        (:eval
         (if (s-contains-p (file-truename "~/RoamNotes") (or buffer-file-name ""))
             (replace-regexp-in-string
              ".*/[0-9]*-?" "☰ "
              (subst-char-in-string ?_ ?  buffer-file-name))
           "%b"))
        (:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

;; (setq frame-title-format
;;       '(""
;;         (:eval
;;          (if (s-contains-p org-roam-directory (or buffer-file-name ""))
;;              (replace-regexp-in-string
;;               ".*/[0-9]*-?" "☰ "
;;               (subst-char-in-string ?_ ?  buffer-file-name))
;;            "%b"))
;;         (:eval
;;          (let ((project-name (projectile-project-name)))
;;            (unless (string= "-" project-name)
;;              (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;; :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 0.33)
               (window-parameters . ((no-other-window . t)
                                     (no-delete-other-windows . t)))))

(use-package! svg-tag-mode
  :config
  (defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
  (defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
  (defconst day-re "[A-Za-z]\\{3\\}")
  (defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))

  (defun svg-progress-percent (value)
    (svg-image (svg-lib-concat
                (svg-lib-progress-bar
                 (/ (string-to-number value) 100.0) nil
                 :height 0.8 :foreground (doom-color 'fg) :background (doom-color 'bg)
                 :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                (svg-lib-tag (concat value "%") nil
                             :height 0.8 :foreground (doom-color 'fg) :background (doom-color 'bg)
                             :stroke 0 :margin 0)) :ascent 'center))

  (defun svg-progress-count (value)
    (let* ((seq (mapcar #'string-to-number (split-string value "/")))
           (count (float (car seq)))
           (total (float (cadr seq))))
      (svg-image (svg-lib-concat
                  (svg-lib-progress-bar (/ count total) nil
                                        :foreground (doom-color 'fg)
                                        :background (doom-color 'bg) :height 0.8
                                        :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                  (svg-lib-tag value nil
                               :foreground (doom-color 'fg)
                               :background (doom-color 'bg)
                               :stroke 0 :margin 0 :height 0.8)) :ascent 'center)))

  (set-face-attribute 'svg-tag-default-face nil :family "Alegreya Sans")
  (setq svg-tag-tags
        `(;; Progress e.g. [63%] or [10/15]
          ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
                                            (svg-progress-percent (substring tag 1 -2)))))
          ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
                                            (svg-progress-count (substring tag 1 -1)))))
          ;; Task priority e.g. [#A], [#B], or [#C]
          ("\\[#A\\]" . ((lambda (tag) (svg-tag-make tag :face 'error :inverse t :height .85
                                                     :beg 2 :end -1 :margin 0 :radius 10))))
          ("\\[#B\\]" . ((lambda (tag) (svg-tag-make tag :face 'warning :inverse t :height .85
                                                     :beg 2 :end -1 :margin 0 :radius 10))))
          ("\\[#C\\]" . ((lambda (tag) (svg-tag-make tag :face 'org-todo :inverse t :height .85
                                                     :beg 2 :end -1 :margin 0 :radius 10))))
          ;; Keywords
          ("TODO" . ((lambda (tag) (svg-tag-make tag :inverse t :height .85 :face 'org-todo))))
          ("HOLD" . ((lambda (tag) (svg-tag-make tag :height .85 :face 'org-todo))))
          ("DONE\\|STOP" . ((lambda (tag) (svg-tag-make tag :inverse t :height .85 :face 'org-done))))
          ("NEXT\\|WAIT" . ((lambda (tag) (svg-tag-make tag :inverse t :height .85 :face '+org-todo-active))))
          ("REPEAT\\|EVENT\\|PROJ\\|IDEA" .
           ((lambda (tag) (svg-tag-make tag :inverse t :height .85 :face '+org-todo-project))))
          ("REVIEW" . ((lambda (tag) (svg-tag-make tag :inverse t :height .85 :face '+org-todo-onhold))))))
  :hook (org-mode . svg-tag-mode)
)


(setq svg-tag-tags
      '((":TODO:" . ((lambda (tag) (svg-tag-make "TODO"))))))
(setq svg-tag-tags
      '((":HELLO:" .  ((lambda (tag) (svg-tag-make "HELLO"))
                       (lambda () (interactive) (message "Hello world!"))
                       "Print a greeting message"))))
(setq svg-tag-tags
      '((":TODO:" . ((lambda (tag) (svg-tag-make tag))))))
(setq svg-tag-tags
      '(("\\(:[A-Z]+:\\)" . ((lambda (tag)
                               (svg-tag-make tag :beg 1 :end -1))))))
(setq svg-tag-tags
      '(("\\(:[A-Z]+\\)\|[a-zA-Z#0-9]+:" . ((lambda (tag)
                                           (svg-tag-make tag :beg 1 :inverse t
                                                          :margin 0 :crop-right t))))
        (":[A-Z]+\\(\|[a-zA-Z#0-9]+:\\)" . ((lambda (tag)
                                           (svg-tag-make tag :beg 1 :end -1
                                                         :margin 0 :crop-left t))))))
(setq svg-tag-tags
      '(("\\(:#[A-Za-z0-9]+\\)" . ((lambda (tag)
                                     (svg-tag-make tag :beg 2))))
        ("\\(:#[A-Za-z0-9]+:\\)$" . ((lambda (tag)
                                       (svg-tag-make tag :beg 2 :end -1))))))

  (defun org-agenda-show-svg ()
    (let* ((case-fold-search nil)
           (keywords (mapcar #'svg-tag--build-keywords svg-tag--active-tags))
           (keyword (car keywords)))
      (while keyword
        (save-excursion
          (while (re-search-forward (nth 0 keyword) nil t)
            (overlay-put (make-overlay
                          (match-beginning 0) (match-end 0))
                         'display  (nth 3 (eval (nth 2 keyword)))) ))
        (pop keywords)
        (setq keyword (car keywords)))))
  (add-hook 'org-agenda-finalize-hook #'org-agenda-show-svg)

(if (require 'toc-org nil t)
    (progn
      (add-hook 'org-mode-hook 'toc-org-mode)

      ;; enable in markdown, too
      (add-hook 'markdown-mode-hook 'toc-org-mode)
      (define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point))
  (warn "toc-org not found"))

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))
