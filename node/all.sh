#!/bin/sh

echo "does node things"

# curl -L https://git.io/n-install | bash -s -- -y lts
# source .
# n lts

cat ~/.dotfiles/node/packages | xargs npm i -g

#export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
#[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

#avn setup


