#!/bin/sh

source ./setup/lib.sh

info "extra zsh setup"

# setup mac-cli
# ref: https://github.com/guarinogabriel/Mac-CLI
sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"

touch $HOME/.z-history

# to fix the issue described in the readme here:
# https://github.com/skalnik/vim-vroom
sudo cp $HOME/.dotfiles/zsh/zprofile.symlink /etc/zprofile
sudo cp $HOME/.dotfiles/zsh/zshenv.symlink /etc/zshenv

success "finished extra zsh setup"
