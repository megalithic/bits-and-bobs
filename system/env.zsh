# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  # Use sublime for my editor.
  export EDITOR='vim'
fi

# Random other exports
export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'
# export CC=/usr/bin/gcc
export DISPLAY=:0.0
export VISUAL='vim'
# export VIMRUNTIME=/usr/local/bin/vim

# so I can run USPTO/jboss stuff sensibly
export JAVA_OPTS="$JAVA_OPTS -Xms2048M -Xmx4096M -XX:MaxPermSize=512M -Djboss.vfs.forceCopy=false"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home"

# export JBOSS_HOME="$HOME/code/Isotope11/uspto/jboss" #5.1ga
# export JBOSS_HOME="$HOME/code/Isotope11/uspto/jboss-eap-6.1" #6.1eap

# Setup terminal, and turn on colors
export TERM=screen-256color-bce
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

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
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# This setting is for the new UTF-8 terminal support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

