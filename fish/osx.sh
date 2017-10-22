#!/bin/sh

echo "fish setup"

mkdir -p ~/.config
ln -sfv ~/.dotfiles/fish ~/.config/fish

# install fisherman (fish plugin manager)
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

echo "finished fish setup"
