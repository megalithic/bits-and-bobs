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
bot "Setup AVN"
###############################################################################
npm i -g avn avn-n
avn setup

###############################################################################
bot "NPM Globals..."
###############################################################################
npm i -g babel
npm i -g babel-eslint@5.0.0
npm i -g bible
npm i -g bower
npm i -g browserify
npm i -g bunyan
npm i -g fkill-cli
npm i -g gulp
npm i -g hicat
npm i -g instant-markdown-d
npm i -g jscpd
npm i -g jsinspect
npm i -g jsonlint
npm i -g livedown
npm i -g mocha
npm i -g chai
npm i -g node-inspector
npm i -g pm2 # http://stackoverflow.com/a/20661027/213904
npm i -g prettyjson
npm i -g react-native-cli
npm i -g speed-test
npm i -g standard@5.3.1
npm i -g snazzy
npm i -g traceur
npm i -g trash # https://github.com/sindresorhus/trash
npm i -g webpack
npm i -g vimdebug
npm i -g vtop # https://github.com/MrRio/vtop
npm i -g yo

