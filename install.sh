#|/bin/bash
cd ~
echo "I will delete old config files"
read -p "Press enter to continue"
rm ~/.git-prompt.sh
rm ~/.extra
rm ~/.bash_prompt
rm ~/.exports
rm ~/.aliases
rm ~/.bash_profile
rm ~/.git-config
rm ~/.inputrc
rm ~/.bash_history
rm ~/.vimrc
rm ~/.vim
rm ~/.gvimrc
rm ~/.tmux.conf
echo 'I will install needed programs using brew'
read -p "Press enter to continue"
brew update
#brew tap homebrew/dupes
#brew install macvim
#brew linkapps
brew install mercurial
#brew install vim
#brew install homebrew/dupes/vim
brew install tmux
brew install reattach-to-user-namespace
brew install autojump
brew install fontforge
#brew install ctags-exuberant
echo 'I will create the links to the new dotfiles ... '
read -p "Press enter to continue"
ln -nfs ~/dotfiles/zshrc .zshrc
ln -nfs ~/dotfiles/vimrc .gvimrc
ln -nfs ~/dotfiles/vimrc .gvimrc
ln -nfs ~/dotfiles/vimrc .vimrc
ln -nfs ~/dotfiles/tmux.conf .tmux.conf
#ln -nfs ~/dotfiles/oh-my-zsh .oh-my-zsh
ln -nfs ~/dotfiles/bin bin
ln -nfs ~/dotfiles/vim .vim
echo 'Now I will copy some programs to ~/bin'
read -p "Press enter to continue"
cp ~/dotfiles/bin/* ~/bin/
cp ~/dotfiles/themes/* ~/dotfiles/oh-my-zsh/themes/
echo "I will delete old local config files and/or links"
read -p "Press enter to continue"
rm -rf ~/.emacs_themes
rm -rf ~/.iterm_color_schemes
rm -rf ~/.zsh_custom
rm ~/.aliases.local
rm ~/.doom.d
rm ~/.gitconfig.local
rm ~/.gitignore
rm ~/.spacemacs
rm ~/.tmux.conf.local
rm ~/.tmuxinator.zsh
rm ~/.vim
rm ~/.vimrc.bundles.local
rm ~/.vimrc.local
rm ~/.xterm-256color-italic.terminfo
rm ~/.zshrc.local
echo 'I will create the links to the new dotfiles-local ... ' 
read -p "Press enter to continue"
#ln -nfs dotfiles-local/vim/vimrc.bundles.local ~/.vimrc.bundles.local
#ln -nfs dotfiles-local/vim/vimrc.local ~/.vimrc.local
ln -nfs ~/dotfiles-local/emacs/doom.d ~/.doom.d
ln -nfs ~/dotfiles-local/emacs/emacs_themes ~/.emacs_themes
ln -nfs ~/dotfiles-local/emacs/spacemacs.local ~/.spacemacs
ln -nfs ~/dotfiles-local/git/gitconfig.local ~/.gitconfig.local
ln -nfs ~/dotfiles-local/git/gitignore.local ~/.gitignore
ln -nfs ~/dotfiles-local/iterm/iterm_color_schemes ~/.iterm_color_schemes
ln -nfs ~/dotfiles-local/iterm/xterm-256color-italic.terminfo ~/.xterm-256color-italic.terminfo
ln -nfs ~/dotfiles-local/tmux/tmux.conf.local ~/.tmux.conf.local
ln -nfs ~/dotfiles-local/tmux/tmuxinator.zsh ~/.tmuxinator.zsh
ln -nfs ~/dotfiles-local/zsh/aliases.local ~/.aliases.local
ln -nfs ~/dotfiles-local/zsh/zsh_custom ~/.zsh_custom
ln -nfs ~/dotfiles-local/zsh/zshenv.local ~/.zshenv.local
ln -nfs ~/dotfiles-local/zsh/zshrc.local ~/.zshrc.local
echo 'Now I will copy some programs to ~/bin'
read -p "Press enter to continue"
cp -rf ~/dotfiles-local/bin/* ~/bin/
echo 'I will install SpaceVim ...'
read -p "Press enter to continue"
curl -sLf https://spacevim.org/install.sh | bash
rm ~/.SpaceVim.d/init.toml
ln -nfs ~/dotfiles-local/vim/spacevim/init.toml ~/.SpaceVim.d/init.toml
echo 'Done! Enjoy your new home!'
