#!/bin/sh

source ./setup/lib.sh

export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh

###############################################################################
bot "NVM versions..."
###############################################################################
require_nvm stable
require_nvm 0.10
require_nvm 0.12
require_nvm iojs
nvm alias default stable

###############################################################################
bot "NPM Globals..."
###############################################################################

require_npm ampersand
require_npm babel
require_npm babel-eslint
require_npm bible
require_npm bower
require_npm brunch
require_npm browserify
require_npm bunyan
require_npm coffeelint
require_npm eslint
require_npm eslint-plugin-react
require_npm eslint-plugin-mocha
require_npm eslint-plugin-chai
require_npm eslint-plugin-babel
require_npm eslint-plugin-smells
require_npm eslint-plugin-html
require_npm eslint-plugin-jasmine
require_npm eslint-plugin-angularrules
require_npm fkill-cli
require_npm gulp
require_npm hicat
require_npm instant-markdown-d
require_npm jscpd
require_npm jshint
require_npm jsinspect
require_npm jsonlint
require_npm jsxhint
require_npm karma
require_npm karma-cli
require_npm livedown
require_npm mocha
require_npm node-inspector
require_npm pm2 # http://stackoverflow.com/a/20661027/213904
require_npm prettyjson
require_npm speed-test
require_npm standard
require_npm snazzy
require_npm traceur
require_npm trash # https://github.com/sindresorhus/trash
require_npm webpack
require_npm vimdebug
require_npm vtop # https://github.com/MrRio/vtop
require_npm yo
