#!/bin/sh

source ./setup/lib.sh

info "installing python packages"

pip install --upgrade pip
pip install gntp pync selenium goobook pycp websocket-client saws pymux neovim pygments setuptools

# pip3 install -U --user neovim
pip2 install -U --user neovim
pip install -U --user neovim

success "finished python setup"
