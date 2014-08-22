#!/bin/sh

# ===============
# SETUP vundle
# ===============
rm -rf ~/.vim/bundle/vundle
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall

cp -rf ~/.dotfiles/vim/colors ~/.vim/bundle/
ln -s ~/.dotfiles/vim/vimrc.symlink ~/.nvimrc
ln -s ~/.vim ~/.nvim
ln -s ~/.dotfiles/vim/snippets ~/.vim/snippets
ln -s ~/.dotfiles/vim/UltiSnips ~/.vim/UltiSnips
