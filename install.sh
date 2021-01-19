echo "Deleteing Symlinks in Home" 
rm ~/.aliases.local
rm ~/.vimrc.local
rm ~/.vimrc.bundles.local
rm ~/.tmux.conf.local
rm ~/.tmuxinator.zsh
rm ~/.gitconfig.local
rm ~/.zshrc.local
rm  ~/.gitignore
rm ~/.spacemacs
rm ~/.doom.d
echo "Creating Symlinks in Home" 
ln -s dotfiles-local/aliases.local ~/.aliases.local
ln -s dotfiles-local/vimrc.local ~/.vimrc.local
ln -s dotfiles-local/vimrc.bundles.local ~/.vimrc.bundles.local
ln -s dotfiles-local/tmux.conf.local ~/.tmux.conf.local
ln -s dotfiles-local/tmuxinator.zsh ~/.tmuxinator.zsh
ln -s dotfiles-local/gitconfig.local ~/.gitconfig.local
ln -s dotfiles-local/zshrc.local ~/.zshrc.local
ln -s dotfiles-local/zshenv.local ~/.zshenv.local
ln -s dotfiles-local/gitignore.local ~/.gitignore
ln -s dotfiles-local/spacemacs.local ~/.spacemacs
ln -s dotfiles-local/doom.d ~/.doom.d
echo "Done! enjoy"
