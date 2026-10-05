# My dotfiles

Configuración personal para macOS (Apple Silicon). Un solo repo, sin dependencias
de otros dotfiles: lo que se usaba de [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
está reescrito aquí.

## Instalación

```sh
git clone https://github.com/alanmaciel/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

`install.sh` crea symlinks desde `$HOME` hacia este repo. Es idempotente; si un
destino es un archivo real, lo mueve a `<archivo>.bak` antes de enlazar.

## Contenido

| Ruta del repo          | Se enlaza en                     |
| ---------------------- | -------------------------------- |
| `zsh/zshrc`            | `~/.zshrc`                       |
| `zsh/zshenv`           | `~/.zshenv`                      |
| `zsh/aliases`          | `~/.aliases`                     |
| `zsh/zsh_custom`       | `~/.zsh_custom`                  |
| `starship.toml`        | `~/.config/starship.toml`        |
| `git/gitconfig`        | `~/.gitconfig`                   |
| `git/gitignore`        | `~/.gitignore`                   |
| `tmux/tmux.conf`       | `~/.tmux.conf`                   |
| `tmux/tmuxinator.zsh`  | `~/.tmuxinator.zsh`              |
| `psql/psqlrc`          | `~/.psqlrc`                      |
| `doom/`                | `~/.config/doom`                 |
| `emacs/spacemacs.local`| `~/.spacemacs`                   |
| `herdr/config.toml`    | `~/.config/herdr/config.toml`    |
| `claude/settings.json` | `~/.claude/settings.json`        |
| `claude/statusline.sh` | `~/.claude/statusline.sh`        |
| `iterm/`               | `~/.iterm_color_schemes`, terminfo |
| `bin/`                 | en el `PATH` desde `~/.zshrc`    |

## Requisitos (Homebrew)

```sh
brew install mise starship autojump tmux herdr
```

Emacs: [Emacs Plus](https://github.com/d12frosted/homebrew-emacs-plus) +
[Doom Emacs](https://github.com/doomemacs/doomemacs#install).

## Enlaces útiles

* [Tmuxinator](https://github.com/tmuxinator/tmuxinator)
* [Starship](https://starship.rs)
* [mise](https://mise.jdx.dev)
* [herdr](https://herdr.dev/docs/)
