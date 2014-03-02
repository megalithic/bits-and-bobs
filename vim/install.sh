#!/bin/sh

rm -rf ~/.vim/bundle/vundle
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c ':BundleInstall' -c ':qa!'

cp -rf ~/.dotfiles/vim/colors ~/.vim/bundle/

