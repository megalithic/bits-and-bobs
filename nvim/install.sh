#!/bin/sh

echo "(neo)vim setup"

if [ ! -d "$HOME/.config" ]; then
  mkdir -p $HOME/.config
fi

ln -sfv $HOME/.dotfiles/nvim $HOME/.config
ln -sfv $HOME/.dotfiles/nvim/init.vim $HOME/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall! +qall!

pip3 install -U --upgrade neovim

echo "finished (neo)vim setup"
