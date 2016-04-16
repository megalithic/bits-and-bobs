#!/bin/sh

# https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
tic ~/.dotfiles/iterm/xterm-256color-italic.terminfo
tic ~/.dotfiles/iterm/screen-256color-italic.terminfo
tic ~/.dotfiles/iterm/tmux-256color.terminfo

# https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/#comment-2508208541
# { infocmp -1 xterm-256color ; echo "\tsitm=\\E[3m,\n\tritm=\\E[23m,"; } > xterm-256color.terminfo
# tic xterm-256color.terminfo

