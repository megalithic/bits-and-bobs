#!/bin/sh

echo "does node things"

curl -L https://git.io/n-install | bash -s -- -y lts
n lts

npm i -g yarn

cat ~/.dotfiles/node/packages | xargs yarn global add

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


