#!/bin/sh

echo "installing python packages"

pip install --upgrade pip pip3
pip install gntp pync goobook pycp websocket-client saws neovim pygments setuptools glances
pip install -U --user neovim

pip3 install --upgrade pip3
pip3 install gntp pync goobook pycp websocket-client saws neovim pygments setuptools glances
pip3 install -U --user neovim

echo "finished python setup"
