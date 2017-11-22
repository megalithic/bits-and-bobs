#!/bin/sh

echo "kitty setup"

mkdir -p ~/.config
ln -sfv ~/.dotfiles/kitty ~/.config/kitty
ln -sfv ~/.dotfiles/kitty/kitty.conf ~/Library/Preferences/kitty/kitty.conf

echo "finished kitty setup"
