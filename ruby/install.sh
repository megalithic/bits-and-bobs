#!/bin/sh

source ./setup/lib.sh

info "installing rubies"

ruby-install ruby 2.1.3
ruby-install ruby 2.2.3

info "sourcing things"
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
RUBIES=(~/.rubies/*)

chruby ruby-2.2.3

#Permit user to write to system rubies and gems ...
sudo chown -R $(whoami) /Library/Ruby/Gems/2.0.0

info "installing gems"
#Installing critical Ruby gems for Rails development ...
require_gem bourbon
require_gem bundler -v 1.10.6
require_gem compass
require_gem coderay
require_gem curses
require_gem git-up
require_gem foreman
require_gem launchy
require_gem maid
require_gem pg
require_gem pry
require_gem rails
require_gem rubocop --no-rdoc --no-ri
require_gem sass
require_gem teamocil
require_gem thin
require_gem pygmentize
require_gem mdless
require_gem rcodetools
require_gem fastri

#Installing gems that need system ruby ...
sudo chruby-exec system -- gem install weechat terminal-notifier

#Set number of cores available for bundler
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

success "finished ruby setup"
