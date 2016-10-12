#!/bin/sh

source ./setup/lib.sh


info "installing n"
# https://github.com/mklement0/n-install
curl -L https://git.io/n-install | bash -s -- -y 6.0 lts 4.2 4.3 4.4
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

info "installing avn"
npm i -g avn avn-n avn-nvm
avn setup
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


info "installing globals packages"
npm i -g babel
npm i -g babel-eslint@5.0.0
npm i -g bible
npm i -g bower
npm i -g browserify
npm i -g bunyan
npm i -g fkill-cli
npm i -g elm
npm i -g elm-test
npm i -g elm-oracle
npm i -g gulp
npm i -g hicat
npm i -g instant-markdown-d
npm i -g jscpd
npm i -g jsinspect
npm i -g jsonlint
npm i -g json
npm i -g livedown
npm i -g mocha
npm i -g chai
npm i -g node-inspector
npm i -g pm2 # http://stackoverflow.com/a/20661027/213904
npm i -g prettyjson
npm i -g react-native-cli
npm i -g sloc
npm i -g speed-test
npm i -g standard@5.3.1
npm i -g snazzy
npm i -g traceur
npm i -g trash # https://github.com/sindresorhus/trash
npm i -g webpack
npm i -g vimdebug
npm i -g vtop # https://github.com/MrRio/vtop
npm i -g yarn
npm i -g yo

success "finished node setup"
