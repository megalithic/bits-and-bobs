#!/bin/sh

brew install nvm
mkdir ~/.nvm
nvm install node
nvm install iojs
nvm use iojs
# nvm alias default iojs # make node default to iojs

# installs yeoman, as well as grunt-cli and bower
npm install -g grunt-cli gulp yo karma grunt karma-cli bower jshint jsxhint ember-cli traceur webpack 6to5 reapp
