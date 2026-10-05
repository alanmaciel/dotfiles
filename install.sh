#!/bin/bash
# Enlaza los archivos de este repo en $HOME. Idempotente: se puede correr
# las veces que haga falta. Si el destino es un archivo real (no un enlace),
# lo mueve a <destino>.bak antes de enlazar.
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DOTFILES/$1" dest="$2"
  if [[ ! -e "$src" ]]; then
    echo "!! falta $src, se omite"
    return
  fi
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "-- $dest es un archivo real; se mueve a $dest.bak"
    mv "$dest" "$dest.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "ok $dest -> $src"
}

# Shell
link zsh/zshrc                         "$HOME/.zshrc"
link zsh/zshenv                        "$HOME/.zshenv"
link zsh/aliases                       "$HOME/.aliases"
link zsh/zsh_custom                    "$HOME/.zsh_custom"
link starship.toml                     "$HOME/.config/starship.toml"

# Git
link git/gitconfig                     "$HOME/.gitconfig"
link git/gitignore                     "$HOME/.gitignore"

# tmux
link tmux/tmux.conf                    "$HOME/.tmux.conf"
link tmux/tmuxinator.zsh               "$HOME/.tmuxinator.zsh"

# Postgres
link psql/psqlrc                       "$HOME/.psqlrc"

# Editores
link doom                              "$HOME/.config/doom"
link emacs/spacemacs.local             "$HOME/.spacemacs"

# herdr
link herdr/config.toml                 "$HOME/.config/herdr/config.toml"

# Claude Code (el hook de herdr se instala aparte: herdr integration install claude)
link claude/settings.json              "$HOME/.claude/settings.json"
link claude/statusline.sh              "$HOME/.claude/statusline.sh"

# Terminal
link iterm/iterm_color_schemes         "$HOME/.iterm_color_schemes"
link iterm/xterm-256color-italic.terminfo "$HOME/.xterm-256color-italic.terminfo"

# Sin mensaje de "Last login" al abrir la terminal
touch "$HOME/.hushlogin"
