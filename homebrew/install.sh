#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew prune
brew update
brew upgrade

brew tap 'homebrew/dupes'
brew tap 'homebrew/brewdler'
brew tap 'kopischke/ctags'
brew tap caskroom/fonts #https://github.com/caskroom/homebrew-fonts
brew install homebrew/dupes/grep
brew install caskroom/cask/brew-cask

# Install homebrew packages
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

brew install git
sudo xcodebuild -license
brew install grc findutils spark zsh gh hub
brew install wget --with-iri

# To be able to install ruby versions older than 1.9.3-p492 (https://github.com/postmodern/ruby-install#ruby):
brew tap homebrew/versions
brew install gcc48

# brew tap Goles/battery
# brew install battery

# TODO: need to get this cleaned up, lots of deps here
brew install autoconf
brew install automake
brew install autojump
brew install avrdude
brew install bazaar
brew install bison
brew install curl --with-openssl --with-ssh --with-rtmp
brew install cmake
brew install cowsay
brew install chromedriver
brew install cscope
brew install ctags
brew install editorconfig
brew install ffind
brew install ffmpeg
brew install freetype
brew install gawk
brew install gdbm
brew install gdb
brew install ghostscript
brew install gist
brew install git-extras
brew install git-flow
brew install gnu-sed
brew install gnutls
brew install grep
brew install heroku-toolbelt
brew install htop-osx
brew install imagemagick
brew install jpeg
brew install jq
brew install lame
brew install lua
brew install maven
brew install markdown
brew install multimarkdown
brew install mercurial
brew install nettle
brew install newt
brew install openssl
brew install ossp-uuid
brew install p7zip
brew install pcre
brew install phantomjs
brew install pkg-config
brew install python
brew install python3
brew install qt --HEAD
brew install readline
brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
brew install sqlite
brew install ssh-copy-id
brew install selenium-server-standalone
brew install the_silver_searcher
brew install tmux
brew tap nviennot/tmate
brew install tmate
brew install terminal-notifier # requires full install of xcode
brew install tig
brew install vim --with-lua --with-perl --with-python3 --with-python --override-system-vi --with-luajit --override-system-vim
brew install macvim --with-lua --with-perl --with-python3 --with-python --custom-icons --with-luajit # --override-system-vim
brew linkapps macvim
brew install watch
brew install x264
brew install xvid
brew install xz
brew install yasm
brew install zsh
brew install zsh-completions
brew install zsh-lovers
brew install zsh-syntax-highlighting
brew install weechat --with-ruby --with-python --with-perl
brew tap neovim/homebrew-neovim
brew install --HEAD neovim --with-lua --with-perl --with-ruby
# brew update
# brew reinstall --HEAD neovim --with-lua --with-perl --with-ruby

# Setup rabbitmq
brew install rabbitmq
ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents

# Setup elasticsearch
brew install elasticsearch
ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents

# Setup mysql
brew install mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mysql/support-files/my-default.cnf ~/.my.cnf
unset TMPDIR
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
mysql.server start
# mysql_secure_installation
# mysqladmin -u root password password

# Setup postgres
brew install postgresql --no-python
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
initdb /usr/local/var/postgres -E utf8
createdb `whoami` # is this needed?

# Setup redis
brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

# Setup fzf
brew install fzf
$(brew info fzf | grep /install)

# Setup homebrew vim to override system vim
sudo mv /usr/bin/vim /usr/bin/vim_system
sudo ln -s /usr/local/bin/vim /usr/bin/vim

brew link openssl --force
brew link python --force

brew cask install firefox
brew cask install flux
brew cask install karabiner
brew cask install bettertouchtool
brew cask install evernote
brew cask install xtrafinder
brew cask install licecap
brew cask install skype
brew cask install hipchat
brew cask install virtualbox
brew cask install vlc
brew cask install parallels-desktop
brew cask install sonos
brew cask install bartender
brew cask install droplr
brew cask install spectacle
brew cask install java

brew linkapps
brew cleanup

exit 0
