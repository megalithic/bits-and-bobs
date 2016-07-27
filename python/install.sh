#!/bin/sh

source ./setup/lib.sh

info "installing python packages"

pip install --upgrade pip
pip install --upgrade pip2
pip install pip3 gntp pync selenium goobook pycp websocket-client saws pymux neovim pygments
pip2 install pip3 gntp pync selenium goobook pycp websocket-client saws pymux neovim pygments

# pip3 install -U --user neovim
pip2 install -U --user neovim
pip install -U --user neovim

success "finished python setup"
