#!/bin/sh

#install iterm2 profile and preferences
brew cask install iterm2
cp ~/.dotfiles/iterm/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
tic xterm-256color-italic.terminfo
tic screen-256color-italic.terminfo
