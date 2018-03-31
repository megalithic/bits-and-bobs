#!/bin/sh

echo "(neo)vim setup"

mkdir -p $HOME/.config
ln -sfv $HOME/.dotfiles/nvim $HOME/.config/nvim
# ln -sfv ~/.dotfiles/nvim ~/.vim
ln -sfv $HOME/.dotfiles/nvim/init.vim $HOME/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall! +qall!

pip3 install --upgrade neovim

echo "finished installing vim-plug"

# mkdir -p ~/.config/nvim/after/indent
# wget https://github.com/pangloss/vim-javascript/blob/master/indent/javascript.vim -O ~/.config/nvim/after/indent/javascript.vim

echo "finished neovim setup"
