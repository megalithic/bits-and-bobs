# #!/bin/sh

echo "setting up ruby things"

ruby-install ruby 2.3.1

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
RUBIES=(~/.rubies/*)

chruby ruby-2.3.1

cat ~/.dotfiles/ruby/default-gems.symlink | xargs gem install

echo "done"
