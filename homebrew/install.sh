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
brew update
brew upgrade

brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install homebrew packages
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

brew install grc findutils spark zsh git
brew install wget --enable-iri

brew install ack apple-gcc42 autoconf automake avrdude bison chruby cmake coreutils cscope ctags faac ffind ffmpeg freetype fuse4x fuse4x-kext gawk gdbm gettext ghostscript gist git-extras git-flow glib gmp gnu-sed gnutls grep heroku-toolbelt htop-osx hub imagemagick jbig2dec jpeg jq jsl jslint lame libelf libevent libffi libftdi0 libgcrypt libgpg-error libksba libpng libsodium libtasn1 libtiff libtool libusb libusb-compat libxml2 libxslt libyaml lua mercurial mutt mysql nettle newt node openssl ossp-uuid p11-kit pcre phantomjs pkg-config popt python python3 qt readline reattach-to-user-namespace redis s-lang sbt sqlite ssh-copy-id sshfs ta-lib texi2html the_silver_searcher tmux todo-txt tokyo-cabinet tor vim watch wkhtmltopdf x264 xvid xz yasm zeromq zsh-completions zsh-lovers zsh-syntax-highlighting solr

brew install weechat --with-ruby --with-python --with-perl
#brew install macvim --with-cscope --with-lua --HEAD

# Some homebrew packages need additional commands to complete their setup:
brew install postgresql --no-python
initdb /usr/local/var/postgres -E utf8

# Install homebrew-cask so we can easily install GUI apps
brew tap phinze/homebrew-cask
brew install brew-cask


# Install homebrew-cask GUI apps
brew cask install alfred
brew cask alfred link
brew cask install google-chrome
brew cask install airmail-beta
brew cask install dropbox
brew cask install bartender
brew cask install evernote
brew cask install f-lux
brew cask install iterm2
brew cask install libreoffice
brew cask install vlc
brew cask install firefox
brew cask install one-password
brew cask install reggy
brew cask install the-unarchiver
brew cask install adobe-air
open /opt/homebrew-cask/Caskroom/adobe-air/3.9/AdobeAIRInstaller.app
brew cask install trim-enabler
brew cask install skype
brew cask install keyremap4macbook
brew cask install android-file-transfer
brew cask install appdelete
brew cask install appzapper
brew cask install hazel
brew cask install witch
brew cask install arduino
brew cask install bettertouchtool
brew cask install cord
brew cask install delibar
brew cask install flash
brew cask install google-drive
brew cask install google-music-manager
brew cask install istat-menus
brew cask install keepassx
brew cask install key-codes
brew cask install lastpass-universal
brew cask install osxfuse
brew cask install parallels-9
brew cask install sparrow
brew cask install spectacle
brew cask install totalfinder
brew cask install steermouse
brew cask install right-zoom

brew cleanup
exit 0
