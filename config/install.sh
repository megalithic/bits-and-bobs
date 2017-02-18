#!/bin/sh

source ./setup/lib.sh

info "(neo)vim setup"

curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
success "finished installing vim-plug"

mkdir -p ~/.config/nvim/after/indent
wget https://github.com/pangloss/vim-javascript/blob/master/indent/javascript.vim -O ~/.config/nvim/after/indent/javascript.vim

ln -sfv ~/.config/nvim ~/.vim
ln -sfv ~/.config/nvim/init.vim ~/.vimrc

success "finished neovim setup"
