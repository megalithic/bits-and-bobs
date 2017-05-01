#!/bin/sh

source ./setup/lib.sh

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

info "checking for existing homebrew install"
if test ! $(which brew)
then
  info "existing install not found, installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  success "installed homebrew"
fi

info "updating homebrew"
brew update
success "updated homebrew"


info "installing homebrew bundler"

set -e
cd "$(dirname "$0")"

ln -sf $PWD/Brewfile ~/Brewfile

brew tap homebrew/bundle
brew bundle
success "installed homebrew bundler and Brewfile formulae"

success "finished homebrew setup"
