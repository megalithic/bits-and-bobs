#!/bin/sh

echo "extra zsh setup"

# install/setup zim
# git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim
# setopt EXTENDED_GLOB
# for template_file ( ${ZDOTDIR:-${HOME}}/.zim/templates/* ); do
#   user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
#   if [[ ! -a ${ZDOTDIR:-${HOME}}/.zshrc ]]; then
#     touch ${user_file}
#     ( print -rn "$(<${template_file})$(<${user_file})" >! ${user_file} ) 2>/dev/null
#   fi
# done

echo "changing your login shell to zsh"
zsh_path=$(which zsh)
grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
chsh -s "$zsh_path" $USER
zsh

touch $HOME/.z-history

# to fix the issue described in the readme here:
# https://github.com/skalnik/vim-vroom
sudo ln -sfv $HOME/.dotfiles/zsh/zprofile.symlink /etc/zprofile
sudo ln -sfv $HOME/.dotfiles/zsh/zshenv.symlink /etc/zshenv

# source ${ZDOTDIR:-${HOME}}/.zlogin

echo "finished extra zsh setup"
