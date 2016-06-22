#!/bin/sh

source ./setup/lib.sh

info "installing python packages"

pip2 install --upgrade pip
pip3 install pip3 gntp pync selenium goobook pycp websocket-client saws pymux neovim

pip3 install -U --user neovim
pip2 install -U --user neovim

success "finished python setup"
