#!/bin/sh

source ./setup/lib.sh

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
	action "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
    	error "unable to install homebrew, script $0 abort!"
    	exit -1
	fi
fi
ok

running "checking brew-cask install"
output=$(brew tap | grep cask)
if [[ $? != 0 ]]; then
	action "installing brew-cask"
	require_brew caskroom/cask/brew-cask
fi
ok

# # Check for Homebrew
# running "checking homebrew install"
# if test ! $(which brew)
# then
# 	action "installing homebrew"
#   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# fi
# ok

running "updating homebrew"
brew update
ok

bot "before installing brew packages, we can upgrade any outdated packages."
read -r -p "run brew upgrade? [y|N] " response
if [[ $response =~ ^(y|yes|Y) ]];then
    # Upgrade any already-installed formulae
    action "upgrade brew packages..."
    brew upgrade
    ok "brews updated..."
else
    ok "skipped brew package upgrades.";
fi


###############################################################################
# Command-line tools (via brew)                                               #
###############################################################################
bot "tapping other kegs first..."

brew tap homebrew/dupes
brew tap homebrew/brewdler
brew tap kopischke/ctags
brew tap caskroom/fonts #https://github.com/caskroom/homebrew-fonts
brew tap neovim/homebrew-neovim
brew tap homebrew/versions # To be able to install ruby versions older than 1.9.3-p492 (https://github.com/postmodern/ruby-install#ruby):
brew tap Goles/battery
brew tap nviennot/tmate

bot "installing homebrew command-line tools..."

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
require_brew coreutils
# Install some other useful utilities like `sponge`
require_brew moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
require_brew findutils

# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
#install bash
#install bash-completion

require_brew ack
require_brew battery

require_brew boot2docker
require_brew chromedriver
require_brew cscope
require_brew ctags
require_brew curl --with-openssl --with-ssh --with-rtmp
require_brew docker
require_brew editorconfig

# Setup elasticsearch
brew install elasticsearch
ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents

require_brew ffind

# Setup fzf
brew install fzf
$(brew info fzf | grep /install)

require_brew gawk
require_brew gcc48
# http://www.lcdf.org/gifsicle/ (because I'm a gif junky)
require_brew gifsicle
# skip those GUI clients, git command-line all the way
require_brew git
require_brew gist
require_brew git-extras
require_brew git-flow
# why is everyone still not using GPG?
require_brew gnupg
# Install GNU `sed`, overwriting the built-in `sed`
# so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
# require_brew gnu-sed --default-names
require_brew go
brew link go
# better, more recent grep
require_brew heroku-toolbelt
require_brew homebrew/dupes/grep
require_brew htop-osx
require_brew hub
require_brew imagemagick
require_brew imagesnap
# jq is a JSON grep
require_brew jq
require_brew multimarkdown
require_brew mercurial

# Setup mysql
brew install mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mysql/support-files/my-default.cnf ~/.my.cnf
unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
mysql.server start
# mysql_secure_installation
# mysqladmin -u root password password

require_brew --HEAD neovim --with-lua --with-perl --with-ruby

require_brew nmap
require_brew nvm

require_brew openssl
brew link openssl --force
require_brew ossp-uuid
require_brew p7zip
require_brew phantomjs
require_brew pkg-config

# Setup postgres
brew install postgresql --no-python
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
initdb /usr/local/var/postgres -E utf8
createdb `whoami` # is this needed?

# Setup pythons
require_brew python
require_brew python3
brew link python --force

# Setup rabbitmq
brew install rabbitmq
ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents

require_brew reattach-to-user-namespace --wrap-pbcopy-and-pbpaste

# Setup redis
brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

require_brew selenium-server-standalone
require_brew spark
require_brew sqlite
require_brew ssh-copy-id
require_brew terminal-notifier # requires full install of xcode
require_brew the_silver_searcher
require_brew tig
require_brew tmate
require_brew tmux
require_brew tree
require_brew vim --with-lua --with-perl --with-python3 --with-python --with-ruby --override-system-vi --with-luajit --override-system-vim

require_brew macvim --with-lua --with-perl --with-python3 --with-python --with-ruby --custom-icons --with-luajit # --override-system-vim
require_brew linkapps macvim

require_brew watch
require_brew weechat --with-ruby --with-python --with-perl
require_brew wget --enable-iri
require_brew xz
require_brew zsh
require_brew zsh-completions
require_brew zsh-lovers
require_brew zsh-syntax-highlighting

###############################################################################
# Native Apps (via brew cask)                                                 #
###############################################################################
bot "installing GUI tools via homebrew casks..."
brew tap caskroom/versions > /dev/null 2>&1

require_cask 1password
# require_cask airmail
require_cask alfred
brew cask alfred link
require_cask bettertouchtool
require_cask box-sync
require_cask bartender
require_cask cloak
# require_cask colorsnapper
require_cask default-folder-x
require_cask diffmerge
require_cask dropbox
require_cask droplr
require_cask evernote
require_cask fantastical
require_cask firefox
require_cask firefox-aurora
require_cask flux
require_cask github
require_cask google-chrome
require_cask google-chrome-canary
require_cask gpgtools
require_cask hazel
require_cask hipchat
require_cask istat-menus
require_cask iterm2
require_cask java
require_cask karabiner
require_cask licecap
require_cask livereload
#require_cask macvim
require_cask numi
require_cask parallels-desktop
require_cask radiant-player
require_cask reggy
require_cask sequel-pro
require_cask shiori
# require_cask shush
require_cask slack
require_cask spectacle
require_cask the-unarchiver
require_cask totalfinder
require_cask xquartz
require_cask usb-overdrive
require_cask virtualbox
# chef-dk, berkshelf, etc
#require_cask chefdk
# vagrant for running dev environments using docker images
#require_cask vagrant # # | grep Caskroom | sed "s/.*'\(.*\)'.*/open \1\/Vagrant.pkg/g" | sh
require_cask vlc
require_cask xtrafinder

bot "Alright, cleaning up homebrew cache..."
brew linkapps
# Remove outdated versions from the cellar
brew cleanup > /dev/null 2>&1
bot "All clean"

