#!/bin/sh

echo "--- begin alacritty setup"

if [ ! -d "$HOME/tmp" ]; then
  mkdir -p $HOME/tmp
fi

cd $HOME/tmp
git clone https://github.com/jwilm/alacritty.git
cd $HOME/tmp/alacritty
cargo build --release
make app
cp -r target/release/osx/Alacritty.app /Applications/Alacritty.app

echo "--- finished alacritty setup"

