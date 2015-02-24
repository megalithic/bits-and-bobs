#!/bin/bash

# install nvm (0.23.3 as of this script)
cd ~
curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | zsh
nvm install 0.12.0
nvm install 0.10.36
nvm install iojs
nvm use 0.10.36 #currently most stable for me
# nvm alias default iojs # make node default to iojs

# installs yeoman, as well as grunt-cli and bower
npm install -g grunt-cli gulp yo karma grunt karma-cli bower jshint jsxhint ember-cli traceur webpack 6to5 reapp
