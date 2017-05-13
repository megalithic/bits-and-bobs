# #!/bin/sh

echo "installing ruby gems"

cat ~/.dotfiles/ruby/default-gems.symlink | xargs gem install

echo "done"
