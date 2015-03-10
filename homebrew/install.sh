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

brew tap homebrew/dupes
brew install homebrew/dupes/grep

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
brew install avrdude
brew install bazaar
brew install bison
brew install curl --with-openssl --with-ssh --with-rtmp
brew install chruby
brew install ruby-install
brew install cmake
brew install cowsay
brew install chromedriver
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
brew install imagemagick
brew install jbig2dec
brew install jpeg
brew install jq
brew install jsl
brew install jshint
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
brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
brew install s-lang
brew install sbt
brew install sqlite
brew install ssh-copy-id
brew install selenium-server-standalone
brew install ta-lib
brew install texi2html
brew install the_silver_searcher
brew install tmux
brew tap nviennot/tmate
brew install tmate
brew install terminal-notifier # requires full install of xcode
brew install tokyo-cabinet
brew install tig
brew install vim --with-lua --with-perl --override-system-vi #--with-python3
brew install watch
brew install wkhtmltopdf
brew install x264
brew install xvid
brew install xz
brew install yasm
brew install zsh
brew install zsh-completions
brew install zsh-lovers
brew install zsh-syntax-highlighting
brew install --HEAD mobile-shell
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

# Setup postgres
brew install postgresql --no-python
initdb /usr/local/var/postgres -E utf8
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
createdb `whoami`

# Setup redis
brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

# Setup homebrew vim to override system vim
sudo mv /usr/bin/vim /usr/bin/vim_system
sudo ln -s /usr/local/bin/vim /usr/bin/vim

# Setup ZSH as default shell and some other stuffs
echo ' -- Setting login shell to zsh '
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

brew link openssl --force
brew link python --force

brew linkapps
brew cleanup

# JDK
# Hat tip:
# http://stackoverflow.com/questions/10268583/how-to-automate-download-and-installation-of-java-jdk-on-linux
# cd ~/.dotfiles
# wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-macosx-x64.dmg
# open jdk-7u71-macosx-x64.dmg

# ==========================================================================

exit 0
