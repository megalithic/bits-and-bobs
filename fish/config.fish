#!/usr/bin/env fish

set fisher_home ~/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# Path to Oh My Fish install.
# set -gx OMF_PATH "/Users/seth.messer/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/seth.messer/.config/omf"

# Load oh-my-fish configuration.
# source $OMF_PATH/init.fish

# set fish_plugins pbcopy balias bang-bang gem nvm brew

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
set -x DISPLAY :0.0

set -x KEYTIMEOUT 1

# so I can run USPTO/jboss stuff sensibly
set -x JAVA_OPTS "$JAVA_OPTS -Xms2048M -Xmx4096M -XX:MaxPermSize=512M -Djboss.vfs.forceCopy=false"
set -x JAVA_HOME '/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home'
set -x ANDROID_HOME /usr/local/opt/android-sdk

# Setup terminal, and turn on 256 colors
set -x TERM 'xterm-256color'
# [ -n "$TMUX" ] &&
set -x TERM screen-256color

# Enable color in grep
set -x GREP_OPTIONS '--color=auto'
set -x GREP_COLOR '3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
set -x ARCHFLAGS '-arch x86_64'
set -x LESS '--ignore-case --raw-control-chars'
set -x PAGER 'less'

# This setting is for the new UTF-8 terminal support
set -x LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8

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

set -x MANPATH "/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
set -x MYSQL /usr/local/mysql/bin
set -x DYLD_LIBRARY_PATH /usr/local/mysql/lib:$DYLD_LIBRARY_PATH
# export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH:.:/usr/local/lib

set -gx PATH /usr/local/sbin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH $DOTPATH/bin $GOROOT/bin $GOPATH/bin $JAVA_HOME/bin $HOME/.gem/ruby/2.2.0/bin/ $HOME/.local/bin $PATH
set -gx PATH $MYSQL $PATH
set -gx PATH /usr/local/lib/node_modules $PATH
set -gx PATH /usr/local/opt/go/libexec/bin $PATH
# make sure gnu-sed works as sed
set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

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

function fkill
  ps -ef|sed 1d|fzf|awk '{print $2}'|read slct
  if [ $slct ]
    kill -9 $slct
  end
end

source /usr/local/share/chruby/chruby.fish
source $HOME/.config/fish/functions/aliases.fish
# source $HOME/.config/fish/functions/fish_prompt.fish

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

  set -l arrow "❯"
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
