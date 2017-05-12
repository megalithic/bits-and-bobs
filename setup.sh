#!/usr/bin/env bash
#
# install/setup all the things

cd "$(dirname "$0")/.."
DOTFILES_ROOT='~/.dotfiles'

source $DOTFILES_ROOT/setup/lib.sh

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1 \n"
}
user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}
success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}
fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}


# I prefer ZSH, set it up as *the shell*
setup_zsh () {
  echo $0 | grep zsh > /dev/null 2>&1 | true

  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    running "changing your login shell to zsh"
    # echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
    # chsh -s $(which zsh);ok
    zsh_path=$(which zsh)
    grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
    chsh -s "$zsh_path" $USER
    zsh
  else
    bot "looks like you are already using zsh. woot!"
  fi
}


# At present, this may/may not be the only way i can easily get
# my stuff from githubs without a password.
#
# FIXME: Find a better way to deal with this, so that I don't have
# to create a new pub/private key each time this is run, bug @pengwynn mayhaps?
setup_ssh_key () {
  if ! [ -f '~/.ssh/id_rsa.pub' ]
  then
    user "Do you want to setup ssh keys? (y|n)"
    read -n 1 response

    if [[ $response =~ ^(no|n|N) ]];then
      success "skipping ssh key setup..."
    else
      if ![[ -f '~/.ssh/id_rsa.pub' ]]
      then
        ssh-keygen -t rsa -b 4096 -C "seth.messer@gmail.com"
        success 'generated ssh key'
      fi

      eval "$(ssh-agent -s)"
      ssh-add ~/.ssh/id_rsa
      success 'added key to ssh-agent...'

      if [[ -f '~/.ssh/id_rsa.pub' ]]
      then
        pbcopy < ~/.ssh/id_rsa.pub
        success 'copied public key to clipboard. paste it into your Github account...'
        open 'https://github.com/account/ssh'
      fi

      info "To verify the key was setup correctly: `ssh -T git@github.com`..."
    fi

    success 'ssh key setup'
  fi
}

# Handles symlinking files and such (dealing with existing files, etc)
link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

# Primarily handles OSX specific things like homebrew bundling, and osx defaults
run_osx_defaults () {
  # If we're on a Mac, let's setup our osx defaults
  if [ "$(uname -s)" == "Darwin" ]
  then
    info "setting osx defaults"
    export ZSH=$HOME/.dotfiles

    # Set OS X defaults
    # FIXME: confirm valid defaults for El Capitan
    $ZSH/osx/set-defaults.sh

    success "osx defaults set"
  fi
}

# Primarily handles OSX specific things like homebrew bundling, and osx defaults
run_brew () {
  # If we're on a Mac, let's install and setup homebrew.
  if [ "$(uname -s)" == "Darwin" ]
  then
    info "installing homebrew dependencies/apps/libs"
    export ZSH=$HOME/.dotfiles

    # Homebrew install and bundling via Brewfile
    $ZSH/homebrew/install.sh
    success "dependencies installed"
  fi
}

run_installers () {
  # If we're on a Mac, let's run my installers
  if [ "$(uname -s)" == "Darwin" ]
  then
    info "executing installers"
    export ZSH=$HOME/.dotfiles

    info "running topic installers"
    source $DOTFILES_ROOT/setup/installers

    success "installers executed"
  fi
}

# Initiates the symlinking of dotfiles and such
symlink_dots () {
  info 'symlinking dots'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

# Pulls down my private repo (git URL provided by user)
setup_private_repo () {
  info "Attempting to clone your private dotfiles repo to $HOME/.dotfiles/private ..."

  warn "Note: if you have 2-factor authentication enabled, you'll need to enter a personal access token when using https:// repo urls."
  user ' - What is your private github repo address? (Leave blank to skip)'
  read -e git_privaterepo

  if [ "$git_privaterepo" == "" ]
  then
    warn "Skipping private repo setup ..."
  else
    if [[ ! -e ~/.dotfiles/private ]]; then
      git clone $git_privaterepo ~/.dotfiles/private
      success "cloned $git_privaterepo to ~/.dotfiles/private"
    fi

    sh ~/.dotfiles/private/install.sh
    success 'executed private dotfiles repo install script'
  fi
}

# run the things!
setup_ssh_key
sudo xcodebuild -license accept

# run_osx_defaults
run_brew
setup_zsh
run_installers

symlink_dots

setup_private_repo


echo ''
echo '  All installed!'