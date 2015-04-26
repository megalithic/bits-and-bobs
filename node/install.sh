#!/bin/sh

# curl https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | bash
mkdir $HOME/.nvm
brew install nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install stable
nvm install 0.10.26
nvm install iojs
nvm use 0.10.26
nvm alias default 0.10.26 # make node default to iojs

# get us some commonly used packages
npm install -g grunt-cli gulp yo karma grunt karma-cli bower jshint jsxhint traceur webpack babel bunyan ampersand eslint jsonlint vimdebug coffeelint livedown node-inspector jscpd jsinspect standard

# NOTES:
# when an npm runs or builds and you see "dyld: lazy symbol binding failed: Symbol not found: _node_module_register"
# do this: https://github.com/rvagg/node-levelup/issues/240#issuecomment-59724897
