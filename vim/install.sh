#!/bin/sh

# ===============
# SETUP vim-plug
# ===============
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

mkdir ~/.config
ln -sfv ~/.dotfiles/vim/UltiSnips ~/.vim/UltiSnips
ln -sfv ~/.dotfiles/vim/UltiSnips ~/.vim/snippets
ln -sfv ~/.dotfiles/vim/spell ~/.vim/spell
ln -sfv ~/.dotfiles/vim/colors ~/.vim/colors
ln -sfv ~/.vim/plugged ~/.vim/bundle
ln -sfv ~/.vim ~/.config/nvim
ln -sfv ~/.dotfiles/vim/vimrc.symlink ~/.config/nvim/init.vim

pip3 install neovim
