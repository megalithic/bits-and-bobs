#!/bin/sh

echo "installing python packages"

pip3 install --upgrade pip3
pip3 install gntp pync selenium goobook pycp websocket-client saws pymux neovim pygments setuptools glances
pip3 install -U --user neovim

echo "finished python setup"
