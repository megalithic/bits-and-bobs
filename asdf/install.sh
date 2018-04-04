#!/bin/sh

#####################
# INCOMPLETE!
#####################

echo "extra asdf setup"

echo ".. setting up asdf folder at ~/.asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3

source ~/.zshrc
source /usr/local/opt/asdf/asdf.sh

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
adsf install nodejs 8


echo "finished extra asdf setup"
