#!/bin/sh

source ./setup/lib.sh

echo $0 | grep zsh > /dev/null 2>&1 | true
if [[ ${PIPESTATUS[0]} != 0 ]]; then
  running "changing your login shell to zsh"
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  login -pfq $USER $(which zsh)
  chsh -s $(which zsh);ok
else
  bot "looks like you are already using zsh. woot!"
fi

# to fix the issue described in the readme here:
# https://github.com/skalnik/vim-vroom
sudo cp ~/.dotfiles/zsh/zprofile.symlink /etc/zprofile
sudo cp ~/.dotfiles/zsh/zprofile.symlink /etc/zshenv

source ~/.dotfiles/zsh/zshrc.symlink
