#!/bin/sh

source ./setup/lib.sh


info "installing n"
# https://github.com/mklement0/n-install
curl -L https://git.io/n-install | bash -s -- -y 6.0 latest 4.0 lts
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

info "installing avn"
npm i -g avn avn-n avn-nvm
avn setup
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


info "installing globals packages"
npm i -g bible fast fkill-cli elm elm-test elm-oracle eslint eslint-plugin-promise eslint-plugin-react eslint-plugin-flowtype eslint-plugin-jsx-a11y eslint-plugin-standard eslint-config-standard eslint-config-standard-jsx gulp hicat instant-markdown-d jscpd jsinspect jsonlint json livedown mocha chai node-inspector pm2 prettyjson react-native-cli sloc speed-test standard traceur trash webpack vimdebug vtop yarn

info "updating npm"
npm update -g npm

success "finished node setup"
