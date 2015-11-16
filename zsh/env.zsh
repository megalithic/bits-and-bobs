export SUDO_EDITOR='vim'
export EDITOR='vim'
export VISUAL='vim'
export ZDOTDIR=$HOME
export VIM_APP_DIR='/Applications/MacVim.app/Contents/MacOs/'
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BREW_PATH="$(brew --prefix)"
export BROWSER=chrome
export _Z_DATA="$HOME/.z-history"

# by default: export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
# we take out the slash, period, angle brackets, dash here.
export WORDCHARS='*?_[]~=&;!#$%^(){}'
export ACK_COLOR_MATCH='red'
# export CC=/usr/bin/gcc
export DISPLAY=:0.0

export KEYTIMEOUT=1

# so I can run USPTO/jboss stuff sensibly
export JAVA_OPTS="$JAVA_OPTS -Xms2048M -Xmx4096M -XX:MaxPermSize=512M -Djboss.vfs.forceCopy=false"

export ANDROID_HOME=/usr/local/opt/android-sdk

# Setup terminal, and turn on 256 colors
export TERM='xterm-256color'
[ -n "$TMUX" ] && export TERM=screen-256color

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

# Custom GC options for custom compiled 1.9.3 rubies
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_GC_HEAP_FREE_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=40000

export ECLIPSE_HOME=/Applications/Eclipse
# export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

# This setting is for the new UTF-8 terminal support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

export MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:/usr/local/lib

# setup docker
# export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=tcp://192.168.59.103:2376 # modify to correct IP/port $(boot2docker ip)

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_OPTS='
  --select-1
  --ansi
  --extended
  --bind ctrl-f:page-down,ctrl-b:page-up
'
# export FZF_COMPLETION_TRIGGER=''
export FZF_TMUX_HEIGHT='20%'

