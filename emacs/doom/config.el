;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load (expand-file-name "modules/editor.el" doom-private-dir))
(load (expand-file-name "modules/misc.el" doom-private-dir))
(load (expand-file-name "modules/ruby.el" doom-private-dir))
(load (expand-file-name "modules/ruby-autocomplete.el" doom-private-dir))
(load (expand-file-name "modules/term.el" doom-private-dir))
(load (expand-file-name "modules/git.el" doom-private-dir))
(load (expand-file-name "modules/lsp.el" doom-private-dir))
(load (expand-file-name "modules/org.el" doom-private-dir))
(load (expand-file-name "modules/autocomplete.el" doom-private-dir))

(if (not (file-exists-p "~/.config/doom/user/config.el"))
    (progn
      (shell-command "cp ~/.config/doom/user/examples/config.el ~/.config/doom/user/config.el")
      (load (expand-file-name "user/config.el" doom-private-dir)))
  (load (expand-file-name "user/config.el" doom-private-dir)))
