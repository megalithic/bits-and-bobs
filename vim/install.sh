#!/bin/sh

rm -rf ~/.vim/bundle/vundle
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c ':BundleInstall' -c ':qa!'

#cd ~/.vim/bundle/tern_for_vim && npm install

ln -sf ~/.dotfiles/vim/vimrc.keybindings.vim ~/.vim/vimrc.keybindings.vim
