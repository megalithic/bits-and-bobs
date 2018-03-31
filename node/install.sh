#!/bin/sh

echo "setting up node things"
curl -L https://git.io/n-install | bash -s -- -y lts
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
n lts
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
avn setup
sh ~/.dotfiles/node/package-installer
echo "done"
