#!/bin/bash

echo "Installing chruby ..."
  echo "source /usr/local/share/chruby/chruby.sh" >> ~/.zprofile
  echo "source /usr/local/share/chruby/auto.sh" >> ~/.zprofile
  echo "chruby ruby-2.1" >> ~/.zprofile

  echo "source /usr/local/share/chruby/chruby.sh" >> ~/.zshrc
  echo "source /usr/local/share/chruby/auto.sh" >> ~/.zshrc
  echo "chruby ruby-2.1" >> ~/.zshrc

  # to fix the issue described in the readme here:
  # https://github.com/skalnik/vim-vroom
  sudo mv /etc/zshenv /etc/zprofile

  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

  ruby-install ruby 2.1
  chruby ruby-2.1

echo "Installing critical Ruby gems for Rails development ..."
  gem install bundler rails pg foreman thin pry launchy teamocil --no-rdoc --no-ri
