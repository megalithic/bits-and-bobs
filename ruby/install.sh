#!/bin/bash

echo "Installing chruby ..."
  brew install chruby
  brew install ruby-install
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

  ruby-install ruby 2.1.3
  chruby ruby-2.1.3

echo "Permit user to write to system rubies and gems ..."
  sudo chown -R $(whoami) /Library/Ruby/Gems/2.0.0

echo "Installing critical Ruby gems for Rails development ..."
  gem install bundler rails pg foreman thin pry launchy teamocil sass compass bourbon curses rubocop --no-rdoc --no-ri

echo "Installing gems that need system ruby ..."
  sudo chruby-exec system -- gem install weechat terminal-notifier

echo "Set number of cores available for bundler"
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))
