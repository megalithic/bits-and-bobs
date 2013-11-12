#!/bin/sh

#install tmux-powerline
git clone https://github.com/erikw/tmux-powerline.git ~/.tmux-powerline

#install our tmux-powerline theme
ln -sf ~/.dotfiles/tmux/tmux-theme.sh ~/.tmux-powerline/themes/tmux-theme.sh
