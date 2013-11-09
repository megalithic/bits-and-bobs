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
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" > /tmp/homebrew-install.log
fi

# Install homebrew packages
brew install grc coreutils spark zsh git
brew install ack apple-gcc42 autoconf automake avrdude bison chruby cmake coreutils cscope ctags faac ffind ffmpeg freetype fuse4x fuse4x-kext gawk gdbm gettext ghostscript gist git-extras git-flow glib gmp gnu-sed gnutls grep heroku-toolbelt htop-osx hub imagemagick jbig2dec jpeg jq jsl jslint lame libelf libevent libffi libftdi0 libgcrypt libgpg-error libksba libpng libsodium libtasn1 libtiff libtool libusb libusb-compat libxml2 libxslt libyaml lua mercurial mutt mysql nettle newt node openssl ossp-uuid p11-kit pcre phantomjs pkg-config popt postgresql --no-python postgresql92 python python3 qt readline reattach-to-user-namespace redis s-lang sbt sqlite ssh-copy-id sshfs ta-lib texi2html the_silver_searcher tmate tmux todo-txt tokyo-cabinet tor vim watch wget wkhtmltopdf x264 xvid xz yasm zeromq zsh-completions zsh-lovers zsh-syntax-highlighting solr

brew install weechat --with-ruby --with-python --with-perl
brew install macvim --with-cscope --with-lua --HEAD

# Install homebrew-cask so we can easily install GUI apps
brew tap phinze/homebrew-cask
brew install brew-cask


# Install homebrew-cask GUI apps
brew cask install alfred
brew cask alfred link
brew cask install google-chrome
brew cask install dropbox
brew cask install bartender
brew cask install evernote
brew cask install f-lux
brew cask install iterm2
brew cask install libre-office
brew cask install vlc
brew cask install firefox
brew cask install one-password
brew cask install reggy
brew cask install the-unarchiver
brew cask install adobe-air
brew cask install trim-enabler
brew cask install skype
brew cleanup
exit 0
