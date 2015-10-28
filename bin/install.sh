#|/bin/bash
cd ~
echo "I will delete old config files"
read -p "Press enter to continue"
rm .git-prompt.sh
rm .extra
rm .bash_prompt
rm .exports
rm .aliases
rm .bash_profile
rm .git-config
rm .inputrc
rm .bash_history
rm .vimrc
rm .vim
rm .gvimrc
rm .tmux.conf
echo 'I will install needed programs using brew'
read -p "Press enter to continue"
brew update
brew tap homebrew/dupes  
brew install macvim
brew linkapps
brew install mercurial
brew install vim
brew install homebrew/dupes/vim
brew install vim
brew install tmux
brew install reattach-to-user-namespace
brew install autojump
brew install fontforge
brew install ctags-exuberant
echo 'I will create the links to the new dotfiles ... '
read -p "Press enter to continue"
ln -nfs ~/dotfiles/zshrc .zshrc
ln -nfs ~/dotfiles/vimrc .gvimrc
ln -nfs ~/dotfiles/vimrc .gvimrc
ln -nfs ~/dotfiles/vimrc .vimrc
ln -nfs ~/dotfiles/tmux.conf .tmux.conf
ln -nfs ~/dotfiles/oh-my-zsh .oh-my-zsh
ln -nfs ~/dotfiles/bin bin
ln -nfs ~/dotfiles/vim .vim
echo 'Now I will copy some programs to ~/bin'
read -p "Press enter to continue"
cp ~/dotfiles/bin/* ~/bin/
cp ~/dotfiles/themes/* ~/dotfiles/oh-my-zsh/themes/
echo 'Done! Enjoy your new home!'
