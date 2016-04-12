#!/usr/bin/env bash

# install and run the emacs package manager, coincidentally, also called 'cask'
if [[ ! -f /usr/local/bin/cask ]]; then
  brew install cask
fi

cask install
