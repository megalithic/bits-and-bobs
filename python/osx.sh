#!/bin/sh

echo "installing python packages"

pip3 install --upgrade pip
pip3 install gntp pync goobook pycp websocket-client saws neovim pygments setuptools glances
pip3 install -U --user neovim

echo "finished python setup"
