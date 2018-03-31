#!/bin/sh

echo "setting up ruby things"
ruby-install ruby 2.3.1
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
RUBIES=(~/.rubies/*)
chruby ruby-2.3.1
sh ~/.dotfiles/ruby/package-installer
echo "done"
