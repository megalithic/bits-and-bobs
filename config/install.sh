#!/bin/sh

# ===============
# SETUP vim-plug
# ===============
curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
