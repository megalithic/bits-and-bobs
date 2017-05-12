#!/bin/sh

info "installing python packages"

pip install --upgrade pip
pip install gntp pync selenium goobook pycp websocket-client saws pymux neovim pygments setuptools glances

# pip2 install --user neovim
# pip install --user neovim
pip3 install -U --user neovim
pip2 install -U --user neovim
pip install -U --user neovim

success "finished python setup"
