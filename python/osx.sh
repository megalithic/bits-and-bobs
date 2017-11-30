#!/bin/sh

echo "installing python packages"

pip3 install --upgrade pip3
pip3 install --upgrade pip2
pip3 install --upgrade pip

pip3 install gntp pync selenium goobook pycp websocket-client saws pymux neovim pygments setuptools glances

# pip2 install --user neovim
# pip install --user neovim
pip3 install -U --user neovim
pip2 install -U --user neovim
# pip install -U --user neovim

echo "finished python setup"
