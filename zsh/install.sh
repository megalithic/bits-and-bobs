#!/bin/sh

source ./setup/lib.sh

info "extra zsh setup"

touch $HOME/.z-history

# to fix the issue described in the readme here:
# https://github.com/skalnik/vim-vroom
sudo cp $HOME/.dotfiles/zsh/zprofile.symlink /etc/zprofile
sudo cp $HOME/.dotfiles/zsh/zshenv.symlink /etc/zshenv

success "finished extra zsh setup"
