#!/bin/sh

# ===============
# SETUP vundle
# ===============
# rm -rf ~/.vim/bundle/vundle
# git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# vim -c ':BundleInstall' -c ':qa!'

# ===============
# SETUP vim-plug
# ===============
mkdir ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

cp -rf ~/.dotfiles/vim/colors ~/.vim/bundle/
ln -s ~/.dotfiles/vim/vimrc.symlink ~/.nvimrc
ln -s ~/.vim ~/.nvim
