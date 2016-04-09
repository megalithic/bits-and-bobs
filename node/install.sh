#!/bin/sh

source ./setup/lib.sh

# install n
# https://github.com/mklement0/n-install
curl -L http://git.io/n-install | bash

###############################################################################
bot "NVM versions..."
###############################################################################
n lts

###############################################################################
bot "NPM Globals..."
###############################################################################

require_npm babel
require_npm babel-eslint@5.0.0
require_npm bible
require_npm bower
require_npm browserify
require_npm bunyan
require_npm fkill-cli
require_npm gulp
require_npm hicat
require_npm instant-markdown-d
require_npm jscpd
require_npm jsinspect
require_npm jsonlint
require_npm livedown
require_npm mocha
require_npm chai
require_npm node-inspector
require_npm pm2 # http://stackoverflow.com/a/20661027/213904
require_npm prettyjson
require_npm react-native-cli
require_npm speed-test
require_npm standard@5.3.1
require_npm snazzy
require_npm traceur
require_npm trash # https://github.com/sindresorhus/trash
require_npm webpack
require_npm vimdebug
require_npm vtop # https://github.com/MrRio/vtop
require_npm yo

