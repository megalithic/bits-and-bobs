#!/bin/sh

# curl https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | bash
mkdir $HOME/.nvm
brew install nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install stable
nvm install 0.10.26
nvm install 0.10.32
nvm install 0.12
nvm install iojs
nvm use 0.12
nvm alias default 0.12

# get us some commonly used packages
npm install -g grunt-cli gulp yo \
  karma grunt karma-cli bower jshint \
  jsxhint traceur webpack babel bunyan \
  ampersand eslint babel-eslint \
  eslint-plugin-react eslint-plugin-mocha eslint-plugin-chai \
  eslint-plugin-babel eslint-plugin-smells eslint-plugin-html \
  eslint-plugin-jasmine eslint-plugin-angularrules jsonlint vimdebug \
  coffeelint livedown node-inspector jscpd \
  jsinspect standard hicat brunch browserify \
  mocha instant-markdown-d

# NOTES:
# when an npm runs or builds and you see "dyld: lazy symbol binding failed: Symbol not found: _node_module_register"
# do this: https://github.com/rvagg/node-levelup/issues/240#issuecomment-59724897
