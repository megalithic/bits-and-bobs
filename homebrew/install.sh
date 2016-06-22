#!/bin/sh

source ./setup/lib.sh

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

running "checking for existing homebrew install"
if test ! $(which brew)
then
  action "existing install not found, installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
ok

running "updating homebrew"
brew update


action "installing homebrew bundler"
brew tap homebrew/bundle
brew bundle

ok
