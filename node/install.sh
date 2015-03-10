#!/bin/sh

brew install nvm
mkdir $HOME/.nvm
nvm install node
nvm install iojs
nvm use iojs
# nvm alias default iojs # make node default to iojs

# installs yeoman, as well as grunt-cli and bower
npm install -g grunt-cli gulp yo karma grunt karma-cli bower jshint jsxhint traceur webpack 6to5 bunyan ampersand

# NOTES:
# when an npm runs or builds and you see "dyld: lazy symbol binding failed: Symbol not found: _node_module_register"
# do this: https://github.com/rvagg/node-levelup/issues/240#issuecomment-59724897
