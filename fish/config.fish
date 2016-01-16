#!/usr/bin/env fish
#
set fisher_home ~/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/seth.messer/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/seth.messer/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set fish_plugins pbcopy balias bang-bang gem nvm ruby brew

set fish_greeting ""
set -x LC_CTYPE ja_JP.UTF-8
set -x LANG ja_JP.UTF-8
set -x ANSIBLE_NOCOWS 1
set -x EDITOR nvim
set -x SUDO_EDITOR nvim
set -x VISUAL nvim
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x FZF_DEFAULT_OPTS '--ansi --inline-info'
set -x VIM_APP_DIR '/Applications/MacVim.app/Contents/MacOs/'
set -x HOMEBREW_CASK_OPTS '--appdir=/Applications'
set -x BREW_PATH '$(brew --prefix)'
set -x BROWSER chrome
# by default: export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
# we take out the slash, period, angle brackets, dash here.
set -x WORDCHARS '*?_[]~=&;!#$%^(){}'
set -x ACK_COLOR_MATCH 'red'
# export CC=/usr/bin/gcc
set -x DISPLAY :0.0

set -x KEYTIMEOUT 1

# so I can run USPTO/jboss stuff sensibly
set -x JAVA_OPTS "$JAVA_OPTS -Xms2048M -Xmx4096M -XX:MaxPermSize=512M -Djboss.vfs.forceCopy=false"
set -x JAVA_HOME '/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home'
set -x ANDROID_HOME /usr/local/opt/android-sdk

# Setup terminal, and turn on 256 colors
set -x TERM 'xterm-256color'
[ -n "$TMUX" ] && export TERM screen-256color

# Enable color in grep
set -x GREP_OPTIONS '--color=auto'
set -x GREP_COLOR '3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
set -x ARCHFLAGS '-arch x86_64'

set -x LESS '--ignore-case --raw-control-chars'
set -x PAGER 'less'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
set -x LC_COLLATE C

# Custom GC options for custom compiled 1.9.3 rubies
set -x RUBY_GC_MALLOC_LIMIT 1000000000
set -x RUBY_GC_HEAP_FREE_SLOTS 500000
set -x RUBY_GC_HEAP_INIT_SLOTS 40000

set -x ECLIPSE_HOME /Applications/Eclipse
# export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

# This setting is for the new UTF-8 terminal support
set -x LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x MANPATH "/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

set -x MYSQL /usr/local/mysql/bin
set -x DYLD_LIBRARY_PATH /usr/local/mysql/lib:$DYLD_LIBRARY_PATH
# export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH:.:/usr/local/lib

# setup docker
# export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=tcp://192.168.59.103:2376 # modify to correct IP/port $(boot2docker ip)

# Setting ag as the default source for fzf
set -x FZF_DEFAULT_COMMAND 'ag -l -g ""'
set -x FZF_DEFAULT_OPTS '
  --select-1
  --ansi
  --extended
  --bind ctrl-f:page-down,ctrl-b:page-up
'
# export FZF_COMPLETION_TRIGGER=''
set -x FZF_TMUX_HEIGHT '20%'

set -x DOTPATH "$HOME/.dotfiles"
set -x GOROOT "$HOME/opt/go"
set -x GOPATH "$HOME/go"

set -gx PATH /usr/local/sbin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH $DOTPATH/bin $GOROOT/bin $GOPATH/bin $JAVA_HOME/bin $HOME/.gem/ruby/2.2.0/bin/ $HOME/.local/bin $PATH
set -gx PATH $MYSQL $PATH
set -gx PATH /usr/local/lib/node_modules $PATH
set -gx PATH /usr/local/opt/go/libexec/bin $PATH
# make sure gnu-sed works as sed
set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

alias tmux "tmux -2"
alias tm "tmux -2"
alias tma "tmux attach"
alias tml "tmux list-window"
alias g "git"
alias v "vim -X"

function fzf_select_history
  history|fzf|read slct
  if [ $slct ]
    commandline $slct
  else
    commandline ''
  end
end

function fish_user_key_bindings
  bind \cx __exit
  bind \cr fzf_select_history
end

function gcd
  ghq list -p|fzf|read slct
  if [ $slct ]
    cd $slct
  end
end

function fkill
  ps -ef|sed 1d|fzf|awk '{print $2}'|read slct
  if [ $slct ]
    kill -9 $slct
  end
end

function fps
  ps -ef|sed 1d|fzf|awk '{print $2}'|read slct
  if [ $slct ]
    echo $slct
  end
end

function fstrace
  ps -ef|sed 1d|fzf|awk '{print $2}'|read slct
  if [ $slct ]
    sudo strace -tt -s 1024 $argv -p $slct
  end
end

function cdf
  set -l q ""
  if [ $argv[1] ]
    set q $argv[1]
  end
  fzf -q $q|read file
  if [ $file ]
    set -l dir (dirname $file)
    if [ $dir ]
      cd $dir
      end
  end
end

function gco
  git branch --all | grep -v HEAD|fzf|read slct
  if [ $slct ]
    git checkout (echo "$slct" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  end
end

function gpush
  git branch -r | grep -v HEAD|fzf|read slct
  if [ $slct ]
    eval git push -v (echo $slct | sed "s/\// /")
  end
end

function gpull
  git branch -r | grep -v HEAD|fzf|read slct
  if [ $slct ]
    eval git pull -v (echo $slct | sed "s/\// /")
  end
end

function gl
  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" $argv | fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` --bind "ctrl-m:execute: echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | less -R'"
end

function e
  set -l arg $argv[1]
  set -l cmd "emacs -fs "

  if [ (pgrep -x -u $USER emacs) ]
    set cmd "emacsclient"
  end

  if test -e $arg
    eval $cmd $arg "&"
    return
  else
    if echo $arg | grep -q -E '\.\w+$'
      eval $cmd $arg "&"
      return
      end
      set -l q ""
      if [ $arg ]
        set q $arg
      end
      fzf -q $q | read file
      if [ $file ]
        eval $cmd $file "&"
      end
  end
end

function _gb
  if test -e "src" -a -e "vendor"
    set -l gopath (pwd):(pwd)/vendor
    set -gx GOPATH $gopath
    set -gx GB_PROJECT (pwd)
  else
    if test $GB_PROJECT
      set -l path (pwd)
      set -l gb $GB_PROJECT
      switch $path
              case "*$gb*"
              case "*"
                set -e GB_PROJECT
                set -gx GOPATH "$HOME/go"
          end
      else
        set -gx GOPATH "$HOME/go"
      end
  end
end

function chpwd --on-variable PWD
  status --is-command-substitution; and return
  _gb
  ll
end

if [ (pgrep -x -u $USER gpg-agent) ]
else
  gpg-connect-agent /bye >/dev/null 2>&1
end
set -e SSH_AGENT_PID
set -e SSH_ASKPASS
set -x SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"

# Set GPG TTY
set -x GPG_TTY (tty)

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

source ~/.config/fish/nvm-wrapper/nvm.fish
nvm use --silent default
source ~/.enhancd/fish/enhancd.fish
alias ecd cd::cd

if status --is-login
  set -l host (hostname)
  set PPID (echo (ps --pid %self -o ppid --no-headers) | xargs)
  if ps --pid $PPID | grep ssh
    tmux has-session -t $host; and tmux attach-session -t $host; or tmux new-session -s $host; and kill %self
    echo "tmux failed to start; using plain fish shell"
  end
end

if not set -q AUTOENVFISH_FILE
  set -g AUTOENVFISH_FILE ".env.fish"
end

function _autoenvfish --on-variable PWD
  if status --is-command-substitution
    return
  end

  set -l envfishdir $PWD
  while test ! "$envfishdir" = "" -a ! -f "$envfishdir/$AUTOENVFISH_FILE"
    set envfishdir (echo "$envfishdir" | sed 's|/[^/]*$||')
  end
  set -l envfishpath "$envfishdir/$AUTOENVFISH_FILE"
  if [ $envfishpath != "$AUTOENVFISH" ]
    if [ -f $envfishpath ]
      set -gx AUTOENVFISH $envfishpath
      else
        set -ex AUTOENVFISH
      end
  end
end

function _source_envfish --on-variable AUTOENVFISH
  if [ -f "$AUTOENVFISH" ]
    echo "loading $AUTOENVFISH"
    . $AUTOENVFISH
  end
end

# prompt
function _hg_branch_name
  echo (command hg branch ^/dev/null)
end
function _is_hg_dirty
  echo (command hg status ^/dev/null)
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l red (set_color red)
  set -l yellow (set_color FFFF99)
  set -l blue (set_color 1E90FF)
  set -l green (set_color green)
  set -l cyan (set_color cyan)
  set -l normal (set_color normal)

  set -l arrow "λ"
  set -l host (hostname)
  set -l cwd $blue(basename (prompt_pwd))

  if [ $SSH_CONNECTION ]
    set arrow $red $arrow
end

if [ (_git_branch_name) ]
  set git_info $green(_git_branch_name)
  set vcs_info ":$git_info"

  if [ (_is_git_dirty) ]
    set -l dirty "*"
    set vcs_info "$vcs_info$dirty"
  end
else
  if [ (_hg_branch_name) ]
    set hg_info $cyan(_hg_branch_name)
    set vcs_info ":$hg_info"

    if [ (_is_hg_dirty) ]
      set -l dirty "*"
      set vcs_info "$vcs_info$dirty"
        end
    end
end

echo -n -s $cwd $vcs_info $normal ' ' $arrow ' '
end

function fish_right_prompt
  set -l blue (set_color 00BFFF)
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
  date "+%H:%M:%S"
  set_color normal
  echo $blue (hostname)
end
