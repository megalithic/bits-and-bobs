#!/bin/sh

source ./setup/lib.sh

info "(neo)vim setup"

curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
success "finished installing vim-plug"

ln -sfv ~/.dotfiles/config/config.symlink/nvim ~/.vim
ln -sfv ~/.dotfiles/config/config.symlink/nvim/init.vim ~/.vimrc

success "finished neovim setup"
