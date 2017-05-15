export SUDO_EDITOR='nvim'
export EDITOR='nvim'
export ALTERNATE_EDITOR='emacs'
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
# export PYTHONPATH="$BREW_PATH/bin/python3.5"
export BROWSER=chrome
export _Z_DATA="$HOME/.z-history"
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_TUI_ENABLE_TRUE_COLOR=1

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

# This setting is for the new UTF-8 terminal support
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

export MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:/usr/local/lib

# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag -l -g ""'

# Setting ripgrep(rg) as the default source for fzf
# fzf/ripgrep stuffs: https://www.reddit.com/r/linux/comments/5rrpyy/turbo_charge_bash_with_fzf_ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# bind -x '"\C-p": vim $(fzf);'
export FZF_DEFAULT_OPTS='
  --select-1
  --ansi
  --extended
  --bind ctrl-f:page-down,ctrl-b:page-up,J:down,K:up
'
# --color fg:252,bg:-1,hl:67,fg+:252,bg+:235,hl+:81
# --color info:144,prompt:161,spinner:135,pointer:135,marker:118

# export FZF_COMPLETION_TRIGGER=''
export FZF_TMUX_HEIGHT='20%'

# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
