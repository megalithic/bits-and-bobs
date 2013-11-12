#!/bin/sh

echo "Installing RVM (Ruby Version Manager) and Ruby 2.0.0, which becomes the default ..."
  curl -L https://get.rvm.io | bash -s stable --ruby
  echo " # RVM [[ -s '/Users/`whoami`/.rvm/scripts/rvm' ]] && source '/Users/`whoami`/.rvm/scripts/rvm'" >> ~/.zshenv
  source ~/.rvm/scripts/rvm

  rvm install ruby-2.0.0
  rvm install ruby-1.9.3

  # ref: http://rvm.io/gemsets/global
  # rvm gemset create global
  # rvm gemset use global

  rvm use 2.0.0@global --default


echo "Installing critical Ruby gems for Rails development ..."
  rvm @global do gem install bundler rails pg foreman thin pry launchy teamocil --no-rdoc --no-ri
  bundle config --global jobs 2

# echo "Update to latest RubyGems version ..."
#   gem update --system

# hey jack! if you ever wanna go to rbenv, then here you go:
# if test ! $(which rbenv)
# then
#   echo "  Installing rbenv for you."
#   brew install rbenv > /tmp/rbenv-install.log
# fi

# if test ! $(which ruby-build)
# then
#   echo "  Installing ruby-build for you."
#   brew install ruby-build > /tmp/ruby-build-install.log
# fi
