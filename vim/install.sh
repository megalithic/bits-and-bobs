#!/bin/sh

# ===============
# SETUP vundle
# ===============
# rm -rf ~/.vim/bundle/vundle
# git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# vim +PluginInstall +qall

# ===============
# SETUP vim-plug
# ===============
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

ln -sfv ~/.dotfiles/vim/vimrc.symlink ~/.nvimrc
ln -sfv ~/.vim ~/.nvim
ln -sfv ~/.dotfiles/vim/UltiSnips ~/.vim/UltiSnips
ln -sfv ~/.dotfiles/vim/spell ~/.vim/spell
ln -sfv ~/.dotfiles/vim/colors ~/.vim/colors
