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
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

brew doctor
brew prune
brew update
brew upgrade

brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install homebrew packages
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

brew install grc findutils spark zsh git
brew install wget --enable-iri

brew tap homebrew/versions
brew install gcc48


# TODO: need to get this cleaned up, lots of deps here
brew install ack
brew install apple-gcc42
brew install autoconf
brew install automake
brew install avrdude
brew install bison
brew install curl-ca-bundle
brew install chruby
brew install ruby-install
# brew install https://raw.github.com/postmodern/chgems/master/homebrew/chgems.rb
brew install cmake
brew install cscope
brew install ctags
brew install faac
brew install ffind
brew install ffmpeg
brew install freetype
brew install gawk
brew install gdbm
brew install gettext
brew install ghostscript
brew install gist
brew install git-extras
brew install git-flow
brew install glib
brew install gmp
brew install gnu-sed
brew install gnutls
brew install grep
brew install heroku-toolbelt
brew install htop-osx
brew install hub
brew install imagemagick
brew install jbig2dec
brew install jpeg
brew install jq
brew install jsl
brew install jslint
brew install lame
brew install libelf
brew install libevent
brew install libffi
brew install libftdi0
brew install libgcrypt
brew install libgpg-error
brew install libksba
brew install libpng
brew install libsodium
brew install libtasn1
brew install libtiff
brew install libtool
brew install libusb
brew install libusb-compat
brew install libxml2
brew install libxslt
brew install libyaml
brew install lua
brew install maven
brew install mercurial

brew install notmuch
brew install mutt --with-sidebar-patch
brew install offlineimap
brew install msmtp

brew install mysql
brew install nettle
brew install newt
brew install node
brew install openssl
brew install ossp-uuid
brew install p11-kit
brew install pcre
brew install phantomjs
brew install pkg-config
brew install popt
brew install python
brew install python3
brew install qt --HEAD
brew install readline
brew install reattach-to-user-namespace
brew install redis
brew install s-lang
brew install sbt
brew install sqlite
brew install ssh-copy-id
brew install ta-lib
brew install texi2html
brew install the_silver_searcher
brew install tmux
brew tap nviennot/tmate
brew install tmate
brew install terminal-notifier
brew install todo-txt
brew install tokyo-cabinet
brew install tor
brew install vim --with-lua --with-perl --override-system-vi #--with-python3
brew install watch
brew install wkhtmltopdf
brew install x264
brew install xvid
brew install xz
brew install yasm
brew install zeromq
brew install zsh
brew install zsh-completions
brew install zsh-lovers
brew install zsh-syntax-highlighting
brew install solr
brew install --HEAD mobile-shell

brew tap laurent22/massren
brew install massren
massren --config editor vim

brew install weechat --with-ruby --with-python --with-perl
brew install macvim --with-cscope --with-lua --with-perl --HEAD
brew install postgresql --no-python

# Setup homebrew vim to override system vim
sudo mv /usr/bin/vim /usr/bin/vim_system
sudo ln -s /usr/local/bin/vim /usr/bin/vim

# Setup ZSH as default shell and some other stuffs
echo ' -- Setting login shell to zsh '
sudo mv /etc/zshenv /etc/zprofile
chsh -s /usr/local/bin/zsh
echo "/usr/local/bin/zsh" >> /etc/shells
echo ' -- All installed!'

# Some homebrew packages need additional commands to complete their setup:
initdb /usr/local/var/postgres -E utf8
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
brew link openssl --force
brew link python --force
sudo ln -s /usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/gcc-4.2 /usr/bin/gcc
sudo ln -s /usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/g++-4.2 /usr/bin/g++
sudo ln -s /usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/cpp-4.2 /usr/bin/cpp

notmuch setup
notmuch new

# Install homebrew-cask so we can easily install GUI apps
brew tap phinze/homebrew-cask
brew install brew-cask

# Install quicklook plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package

# Install homebrew-cask GUI apps
# brew cask install alfred
# brew cask alfred link
# brew cask install dropbox
# brew cask install bartender
# brew cask install evernote
# brew cask install f-lux
# brew cask install libreoffice
# brew cask install vlc
# brew cask install firefox
# brew cask install reggy
# brew cask install the-unarchiver
# brew cask install trim-enabler
# brew cask install skype
# brew cask install keyremap4macbook
# brew cask install android-file-transfer
# brew cask install hazel
# brew cask install witch
# brew cask install arduino
# brew cask install bettertouchtool
# brew cask install cord
# brew cask install flash
# brew cask install google-drive
# brew cask install google-music-manager
# brew cask install istat-menus
# brew cask install key-codes
# brew cask install spectacle
# brew cask install totalfinder
# brew cask install steermouse
# brew cask install right-zoom

brew linkapps
brew cleanup

# JDK
curl -O http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-macosx-x64.dmg
open jdk-7u45-macosx-x64.dmg
# ==========================================================================

exit 0
