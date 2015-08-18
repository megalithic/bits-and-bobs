#!/bin/sh

source ./setup/lib.sh

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

running "checking homebrew install"
if test ! $(which brew)
then
  action "installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  action "installing brew-cask"
  brew install caskroom/cask/brew-cask
fi
ok

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
brew tap caskroom/versions > /dev/null 2>&1

bot "installing homebrew command-line tools..."

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils

# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
#install bash
#install bash-completion

brew install ack
brew install battery

brew install boot2docker
brew install chromedriver
brew install cscope
brew install ctags
brew install curl --with-openssl --with-ssh --with-rtmp
brew install docker
brew install editorconfig

# Setup elasticsearch
brew install elasticsearch
ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents

brew install ffind

# Setup fzf
brew install fzf
$(brew info fzf | grep /install)

brew install gawk
brew install gcc48
# http://www.lcdf.org/gifsicle/ (because I'm a gif junky)
brew install gifsicle
# skip those GUI clients, git command-line all the way
brew install git
brew install gist
brew install git-extras
brew install git-flow
# why is everyone still not using GPG?
brew install gnupg
# Install GNU `sed`, overwriting the built-in `sed`
# so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
# brew install gnu-sed --default-names
brew install go
brew link go
# better, more recent grep
brew install heroku-toolbelt
brew install homebrew/dupes/grep
brew install htop-osx
brew install hub
brew install imagemagick
brew install imagesnap
# jq is a JSON grep
brew install jq
brew install multimarkdown
brew install mercurial

# Setup mysql
brew install mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mysql/support-files/my-default.cnf ~/.my.cnf
unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
mysql.server stop
mysql.server start
# mysql_secure_installation
# mysqladmin -u root password password

brew install --HEAD neovim --with-lua --with-perl --with-ruby

brew install nmap
brew install nvm

brew install openssl
brew link openssl --force
brew install ossp-uuid
brew install p7zip
brew install phantomjs
brew install pkg-config

# Setup postgres
brew install postgresql --no-python
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
initdb /usr/local/var/postgres -E utf8
createdb `whoami` # is this needed?

# Setup pythons
brew install python
brew install python3
brew link python --force

# Setup rabbitmq
brew install rabbitmq
ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents

brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste

# Setup redis
brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

brew install selenium-server-standalone
brew install spark
brew install sqlite
brew install ssh-copy-id
brew install terminal-notifier # requires full install of xcode
brew install the_silver_searcher
brew install tig
brew install tmate
brew install tmux
brew install tree
brew install vim --with-lua --with-perl --with-python3 --with-python --with-ruby --override-system-vi --with-luajit --override-system-vim

brew install macvim --with-lua --with-perl --with-python3 --with-python --with-ruby --custom-icons --with-luajit # --override-system-vim
brew install linkapps macvim

brew install watch
brew install weechat --with-ruby --with-python --with-perl
brew install wget --enable-iri
brew install xz
brew install zsh
brew install zsh-completions
brew install zsh-lovers
brew install zsh-syntax-highlighting

###############################################################################
# Native Apps (via brew cask)                                                 #
###############################################################################
bot "installing GUI tools via homebrew casks..."

brew cask install 1password
# brew cask install airmail
brew cask install alfred
brew cask alfred link
brew cask install bettertouchtool
brew cask install box-sync
brew cask install bartender
brew cask install cloak
# brew cask install colorsnapper
brew cask install default-folder-x
brew cask install diffmerge
brew cask install dropbox
brew cask install droplr
brew cask install evernote
brew cask install fantastical
brew cask install firefox
brew cask install firefox-aurora
brew cask install flux
brew cask install github
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install gpgtools
brew cask install hazel
brew cask install hipchat
brew cask install istat-menus
brew cask install iterm2
brew cask install java
brew cask install karabiner
brew cask install licecap
brew cask install livereload
#brew cask install macvim
brew cask install numi
brew cask install parallels-desktop
brew cask install radiant-player
brew cask install reggy
brew cask install sequel-pro
brew cask install shiori
# brew cask install shush
brew cask install slack
brew cask install spectacle
brew cask install the-unarchiver
brew cask install totalfinder
brew cask install xquartz
brew cask install usb-overdrive
brew cask install virtualbox
# chef-dk, berkshelf, etc
#brew cask install chefdk
# vagrant for running dev environments using docker images
#brew cask install vagrant # # | grep Caskroom | sed "s/.*'\(.*\)'.*/open \1\/Vagrant.pkg/g" | sh
brew cask install vlc
brew cask install xtrafinder

bot "Alright, cleaning up homebrew cache..."
brew linkapps
# Remove outdated versions from the cellar
brew cleanup > /dev/null 2>&1
bot "All clean"

exit 0
