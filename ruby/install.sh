#!/bin/bash

echo "Installing RVM (Ruby Version Manager) and Ruby 2.0.0, which becomes the default ..."
  curl -L https://get.rvm.io | bash -s stable --ruby
  echo " # RVM [[ -s '/Users/`whoami`/.rvm/scripts/rvm' ]] && source '/Users/`whoami`/.rvm/scripts/rvm'" >> ~/.zshenv
  source ~/.rvm/scripts/rvm
  # avoid weird ssl issues with rvm on osx
  # ref: http://www.randomactsofsentience.com/2013/10/emremotefetcherfetcherror-sslconnect.html
  rvm osx-ssl-certs update all
  rvm get stable --auto-dotfiles

  rvm install ruby-2.0.0
  rvm install ruby-1.9.3
  rvm install ruby-1.9.2

  # ref: http://rvm.io/gemsets/global
  /bin/bash rvm gemset create global
  /bin/bash rvm gemset use global

  /bin/bash rvm use 2.0.0@global --default

  # disable .rvmrc warnings
  rvm rvmrc warning ignore all.rvmrcs

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
