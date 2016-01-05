echo "Creating Symlinks in Home" 
ln -s dotfiles-local/aliases.local ~/.aliases.local
ln -s dotfiles-local/vimrc.local ~/.vimrc.local
ln -s dotfiles-local/vimrc.bundles.local ~/.vimrc.bundles.local
ln -s dotfiles-local/tmux.conf.local ~/.tmux.conf.local
ln -s dotfiles-local/tmuxinator.zsh ~/.tmuxinator.zsh
ln -s dotfiles-local/gitconfig.local ~/.gitconfig.local
ln -s dotfiles-local/zshrc.local ~/.zshrc.local
ln -s dotfiles-local/gitignore.local ~/.gitignore
echo "Done! enjoy"
