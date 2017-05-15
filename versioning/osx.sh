#/bin/env bash

echo "sets up asdf-vm things"

set -e
cd "$(dirname "$0")"


if [ -s ~/.asdf ]; then
  echo "asdf installed, skipping..."
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0
fi

# echo "Creating symlinks..."

# ln -sf $PWD/asdfrc.symlink ~/.asdfrc
# ln -sf $PWD/tool-versions.symlink ~/.tool-versions

echo "DONE!"
