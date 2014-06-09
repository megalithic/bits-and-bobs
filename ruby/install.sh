#!/bin/bash

echo "Installing chruby ..."
  # to fix the issue described in the readme here:
  # https://github.com/skalnik/vim-vroom
  sudo rm /etc/zshenv
  sudo cp ~/.dotfiles/zsh/zprofile.zsh /etc/zprofile

  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

  ruby-install ruby 2.1
  chruby ruby-2.1

echo "Installing critical Ruby gems for Rails development ..."
  gem install bundler rails pg foreman thin pry launchy teamocil sass --no-rdoc --no-ri

echo "Installing gems that need system ruby ..."
  sudo chruby-exec system -- gem install weechat terminal-notifier
