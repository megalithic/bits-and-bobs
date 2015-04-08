export EDITOR='vim'
export VISUAL='vim'
export VIM_APP_DIR='/Applications/MacVim.app/Contents/MacOs/'

# Random other exports
export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'
# export CC=/usr/bin/gcc
export DISPLAY=:0.0

export KEYTIMEOUT=1

# so I can run USPTO/jboss stuff sensibly
export JAVA_OPTS="$JAVA_OPTS -Xms2048M -Xmx4096M -XX:MaxPermSize=512M -Djboss.vfs.forceCopy=false"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home"

# Setup terminal, and turn on 256 colors
export TERM='xterm-256color'
[ -n "$TMUX" ] && export TERM=screen-256color
# export TERM='xterm-256color-italic' # if this doesn't work set it in iterm2 profiles > terminal
#
# export CLICOLOR=1
# export LSCOLORS=Exfxcxdxbxegedabagacad # ZSH doesn't recognize LSCOLORS
# export LS_COLORS="di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'

#export NODE_PATH=/opt/github/homebrew/lib/node_modules
#export PYTHONPATH=/usr/local/lib/python2.6/site-packages
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

#export GH_ISSUE_CREATE_TOKEN=083f60c674d8eb41f98258df9fc8d94cb733218a

# Custom GC options for custom compiled 1.9.3 rubies
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_GC_HEAP_FREE_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=40000

export ECLIPSE_HOME=/Applications/Eclipse
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

# This setting is for the new UTF-8 terminal support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

export MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
