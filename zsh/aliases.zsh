# delete symlinks (remove evertyhing after '*' to just search for symlinks): find /home -maxdepth 1 -lname '*' -exec rm {} \;
# create the target folder and move the source to the new destination: mkdir -p ~/.dotfiles/git/bak && mv git* "$_"

# alias top="htop"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dirs="ls *(/)"
alias ff="ffind -S"
alias f="ffind"
alias files="find . -type f | wc -l"
alias a="ack"
alias new="print -rl -- **/*(Dom[1,5])"

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -FA --color"
  alias l="gls -lAhG --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi
alias s="ls"
alias last='ls *(.om[1])'

alias webcam="sudo killall VDCAssistant"
alias dsnuke="find . -name '*.DS_Store' -type f -ls -delete"
alias pkey="pbcopy < ~/.ssh/id_rsa.pub"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"


## - TMUX -------------------------------------------------
alias tmux="TERM=screen-256color-bce tmux -u -2"
alias tm=tmux
alias takeover="tmux detach -a"

alias teama="tmux attach-session -t default"
alias team="cd ~ && teamocil --here default"
alias toka="tmux attach-session -t welltok"
alias tok="cd ~ && teamocil --here welltok"

## - ag/ack/grep/fzf --------------------------------------
# https://github.com/junegunn/fzf/wiki/Examples#searching-file-contents
# alias ag="ag --nobreak --nonumbers --noheading . | fzf"

## - DOCKER -----------------------------------------------
# alias docker="sudo docker -H $DOCKER_HOST"
alias docker-ip=dockerip
alias docker-ubuntu="docker run -i -t ubuntu /bin/bash"

## - BREW -------------------------------------------------
alias b="brew"

## - PYTHON -----------------------------------------------
alias py="python"

## - VIM --------------------------------------------------
# alias vim="mvim -v"
alias vi="vim"
alias vmi="vim"
alias im=vim
alias vm="vim"
alias m="vim"
alias vimprofile="less ~/tmp/profile.log | sort -k 2"

# presently not working in neovim:
# - copy/paste (vim-pasta)
# - python bindings (neocomplete)
# - cursor changes (insert/normal mode)
# alias vim="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim" # just wanna use neovim
alias updatenvim="brew update; brew reinstall --HEAD neovim"
alias nv="nvim"
# alias vim="nvim"

## - EDITS -----------------------------------------------
alias ez="v ~/.zshrc"
alias eza="v ~/.dotfiles/zsh/aliases.zsh"
alias ezf="v ~/.dotfiles/zsh/functions.zsh"
alias vars="v ~/.localrc"
alias ezl="v ~/.localrc"
alias ezo="v ~/.dotfiles/zsh/config.zsh"
alias ezc="v ~/.dotfiles/zsh/config.zsh"
alias eze="v ~/.dotfiles/zsh/env.zsh"
alias ezp="v ~/.dotfiles/zsh/path.zsh"
alias ezkb="v ~/.dotfiles/zsh/keybindings.zsh"
alias ev="v ~/.dotfiles/vim/vimrc.symlink"
alias et="v ~/.dotfiles/tmux/tmux.conf.symlink"

## - FOLDERS -----------------------------------------------
# alias code="cd ~/code"
alias dot=d
alias code=c
alias dev="cd ~/code"
alias music="cd ~/music/Audio"
alias sand="cd ~/code/sandbox"
alias repos="cd ~/code"
alias logs="cd ~/code/logs/"
alias docs="cd ~/Documents"
alias box="cd ~/Dropbox/"
alias dropbox="box"
alias scripts="cd ~/Dropbox/scripts/"
# alias android="cd ~/Dropbox/Android/adb/"
alias adb="/Users/replicant/Dropbox/Android/adb/platform-tools/adb"
alias fastboot="/Users/replicant/Dropbox/Android/adb/platform-tools/fastboot"
alias dl="cd $HOME/Downloads/"
alias gop="cd $GOPATH"

## - POSTGRES -----------------------------------------------
alias startpg="pg_ctl -D /usr/local/var/postgres -l logfile start" #`pg_ctl -D /usr/local/var/postgres -l ~/code/logs/server.log start` OR `postgres -D /usr/local/var/postgres` OR `pg_ctl -D /usr/local/var/postgres -l logfile start`
alias stoppg="pg_ctl -D /usr/local/var/postgres -l logfile stop" #`postgres -D /usr/local/var/postgres`
alias pgstart="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pgstop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
  # To have launchd start postgresql at login:
  #     ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  # Then to load postgresql now:
  #     launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  # Or, if you don't want/need launchctl, you can just run:
  #     pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

alias pgsetup="sh ~/Dropbox/scripts/postgresql_db_setup.sh"

alias server="python -m SimpleHTTPServer"
# alias srv=server
alias chromedebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --js-flags=--stack_trace_limit=-1 --user-data-dir=/tmp/jsleakcheck"
alias chrome="open -a '/Applications/Google Chrome.app' --args --disable-web-security"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
# Thanks @sindersorhus: https://github.com/mathiasbynens/dotfiles/commit/bd9429af1cfdc7f4caa73e6f98773ed69a161c9c
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias dirsize="du -sh * | sort -n"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias dus='du -sckx * | sort -nr'

# alias chk='ps auxwww | ag'
alias die='pkill -9 -f'
alias port='lsof -i :'

alias mg="mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf"
alias startred="redis-server /usr/local/etc/redis.conf"
alias redisstart="startred"
alias redstart="startred"
alias redcli="redis-cli"

alias ex=extract
alias cleanrails="rm -rf .DS_Store .gitignore .rspec .rvmrc Gemfile GuardFile README.md"
alias sourcez=". $HOME/.zshrc"
alias srcz=sourcez
alias sz=sourcez
alias cls="clr && ls"
alias ip="ifconfig"
alias get="curl -OL"
alias g="grep -r -i --color='auto'"
alias irc="weechat-curses"
alias rc=irc
alias ip="ipconfig getifaddr"
alias clr=clear
alias syncoctoprint="scp pi@octopi.local:/home/pi/.octoprint/config.yaml $HOME/Dropbox/3d/configs/octoprint"

## - ANDROID -----------------------------------------------
alias fb="moto-fastboot-osx64"

## - GIT -----------------------------------------------
alias git='/usr/local/bin/git'

# # Use `hub` as our git wrapper:
# #   http://defunkt.github.com/hub/
# hub_path=$(which hub)
# if (( $+commands[hub] ))
# then
#   alias git=$hub_path
# fi
#
alias gpreq="~/.dotfiles/bin/git-pr"
alias preq=gpreq
alias req=gpreq
alias push="git push -u"
alias pull="git pull"
alias grm="git rm -r"
alias gc="git clone"
alias clone="git clone"
alias gcv="git commit -v"
alias gcm="git commit -m"
alias com="git commit"
alias gf="git fetch"
alias gm="git merge"
alias gmt="git mergetool"
# alias gcom="git checkout master"
# alias gcod="git checkout development"
# alias gpom="git push origin master"
# alias gpod="git push origin development"
# alias gpum="git push upstream master"
alias gfo="git fetch origin"
alias gpo="git push origin -u"
# alias gfom="git fetch && git merge origin/master"
# alias gfod="git fetch && git merge origin/development" # will need to change this to origin/develop for NORMAL github repo setup
# alias gfum="git fetch upstream && git merge upstream/master"
alias gg="git grep -niI --color=auto"
alias gco="git checkout"
alias changes="git diff --cached"
alias gd="git diff"
alias reset="git reset --hard HEAD"
alias gs="git status -s"
alias gt="git tree"
alias log="git log --stat"
alias dangled="git fsck --no-reflog | awk '/dangling commit/ {print $3}'" #gitk --all $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )
alias mxm="git fetch mxm && git merge mxm/develop"
alias show='git show --pretty="format:" --name-only '
alias feature='git flow feature'
alias branch='git for-each-ref --sort=-committerdate refs/heads/ | less'
alias glog="git l"
alias conflict="git diff --name-only --diff-filter=U"
alias gap="git add --patch"
alias gaa="git aa"
alias uncommit="git reset --soft 'HEAD^'" # re-commit with `git commit -c ORIG_HEAD`
alias gex="git archive master | tar -x -C" # update this to support more than the master branch
alias rebase="git pull --rebase origin master"
alias conflicted="git ls-files -u | cut -f 2 | sort -u"
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"

## - RUBY / RAILS -----------------------------------------------
alias be="bundle exec"
alias br="bundle exec ruby"
alias beg="bundle exec guard"
alias b="bundle"
alias bu="bundle"
alias gen="bundle exec rails g"
alias annotate="bundle exec annotate"
alias dbm="rake db:migrate"
alias dbt="rake db:test:prepare"
alias dbrb="rake db:rollback STEP=1"
alias spork="bundle exec spork"
alias guard="bundle exec guard start"
alias rbox="rails c test -s"
alias nodeapp="nodemon app.js 3000"
alias rs="bundle exec rails server"
alias rsp="bundle exec rails server -p"
alias rsprod="bundle exec rails server -e production"
alias rc="bundle exec rails console"
alias bec=rc

# Unicode emotions; WHY DO I HAVE THESE FEELS!?
alias srs="echod  '\n ಠ_ಠ\n' | pbcopy"
alias srsheh="echo '\n ಠ‿ಠ\n' | pbcopy"
alias srsmad="echo '\n ಠ▃ಠ\n' | pbcopy"
alias srswha="echo '\n ಠ.ಠ\n' | pbcopy"
alias flip="echo '\n（╯°□°）╯︵ ┻━┻\n' | pbcopy"
alias flipsrs="echo '\n（╯ಠ▃ಠ）╯︵ ┻━┻\n' | pbcopy"
alias flipfix="echo '\n（┬──┬ ノ( ゜-゜ノ)\n' | pbcopy"
alias crysrs="echo '\n ಥ_ಥ\n' | pbcopy"
alias crywobble="echo '\n ಥ﹏ಥ\n' | pbcopy"
alias yeaaaaaah="echo '\n •_•)\n( •_•)>⌐■-■\n(⌐■_■)\n' | pbcopy"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip_wifi="ipconfig getifaddr en0"
alias localip_display="ipconfig getifaddr en2"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache; http://osxdaily.com/2014/11/20/flush-dns-cache-mac-os-x/
alias dnsflush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
