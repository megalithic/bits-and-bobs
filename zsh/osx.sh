#!/bin/sh

echo "extra zsh setup"

# echo $0 | grep zsh > /dev/null 2>&1 | true

# if [[ ${PIPESTATUS[0]} != 0 ]]; then
  echo "changing your login shell to zsh"
  # echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  # chsh -s $(which zsh);ok
  zsh_path=$(which zsh)
  grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
  chsh -s "$zsh_path" $USER
  zsh
# else
#   echo "looks like you are already using zsh. woot!"
# fi

# setup mac-cli
# ref: https://github.com/guarinogabriel/Mac-CLI
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"

touch $HOME/.z-history

# to fix the issue described in the readme here:
# https://github.com/skalnik/vim-vroom
sudo ln -sfv $HOME/.dotfiles/zsh/zprofile.symlink /etc/zprofile
sudo ln -sfv $HOME/.dotfiles/zsh/zshenv.symlink /etc/zshenv
# sudo cp $HOME/.dotfiles/zsh/zprofile.symlink /etc/zprofile
# sudo cp $HOME/.dotfiles/zsh/zshenv.symlink /etc/zshenv

echo "finished extra zsh setup"
