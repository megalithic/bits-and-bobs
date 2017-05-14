#!/bin/sh

echo "(neo)vim setup"

mkdir -p ~/.config
ln -sfv ~/.dotfiles/nvim ~/.config/nvim
# ln -sfv ~/.dotfiles/nvim ~/.vim
ln -sfv ~/.dotfiles/nvim/init.vim ~/.vimrc

# curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
echo "finished installing vim-plug"

# mkdir -p ~/.config/nvim/after/indent
# wget https://github.com/pangloss/vim-javascript/blob/master/indent/javascript.vim -O ~/.config/nvim/after/indent/javascript.vim

echo "finished neovim setup"