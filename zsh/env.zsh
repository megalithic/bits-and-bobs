export SUDO_EDITOR='nvim'
export EDITOR='nvim'
export ALTERNATE_EDITOR='oni'
export VISUAL='nvim'
export ZDOTDIR=$HOME
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export BREW_PATH="$(brew --prefix)"
export BREW_CASK_PATH="/opt/homebrew-cask/Caskroom"
export NVIMRUNTIME='/usr/local/share/nvim/runtime'
export TERMINFO=$HOME/.terminfo
# export TERMINFO=/usr/share/terminfo
# export NVIM_PYTHON_LOG_FILE='~/tmp/nvim_python.log'
# export NVIM_PYTHON_LOG_LEVEL=DEBUG
# export PYTHONPATH="$BREW_PATH/bin/python3.5"
export BROWSER="open"
export _Z_DATA="$HOME/.z-history"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export TERM_ITALICS="TRUE"

# by default: export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
# we take out the slash, period, angle brackets, dash here.
export WORDCHARS='*?_[]~=&;!#$%^(){}'
export ACK_COLOR_MATCH='red'
# export CC=/usr/bin/gcc
export DISPLAY=:0.0

# reduce ESC key delay to 0.1
export KEYTIMEOUT=1

# so I can run USPTO/jboss stuff sensibly
export JAVA_OPTS="$JAVA_OPTS -Xms2048M -Xmx4096M -XX:MaxPermSize=512M -Djboss.vfs.forceCopy=false"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home"
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk

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
export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"

export ECLIPSE_HOME=/Applications/Eclipse
export SSL_CERT_FILE=''
unset SSL_CERT_FILE

export CURL_CA_BUNDLE=''

# GNUpg setup: https://github.com/drduh/YubiKey-Guide#create-temporary-working-directory-for-gpg
export GNUPGHOME=$(mktemp -d) #; echo $GNUPGHOME

# This setting is for the new UTF-8 terminal support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

export MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:/usr/local/lib

_gen_fzf_default_opts() {
  local color00='#002b36'
  local color01='#073642'
  local color02='#586e75'
  local color03='#657b83'
  local color04='#839496'
  local color05='#93a1a1'
  local color06='#eee8d5'
  local color07='#fdf6e3'
  local color08='#dc322f'
  local color09='#cb4b16'
  local color0A='#b58900'
  local color0B='#859900'
  local color0C='#2aa198'
  local color0D='#268bd2'
  local color0E='#6c71c4'
  local color0F='#d33682'

  export FZF_DEFAULT_OPTS="
  --no-height
  --bind 'ctrl-j:ignore,ctrl-k:ignore'
  --inline-info
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "

  export FZF_DEFAULT_OPTS="
  --inline-info
  --select-1
  --ansi
  --extended
  --bind ctrl-f:page-down,ctrl-b:page-up,J:down,K:up
  "
}

_gen_fzf_default_opts

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX_HEIGHT='20%'

