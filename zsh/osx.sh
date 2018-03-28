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

# ASDF setup
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

source ~/.zshrc

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf local ruby 2.3.1
asdf local nodejs 8.0.0

echo "finished extra zsh setup"
