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

alias ls="gls -Fha --color"
alias l="gls -lAh --color"
alias ll="gls -lFh --color"
alias la='gls -A --color'

alias webcam="sudo killall VDCAssistant"
alias dsnuke="find . -name '*.DS_Store' -type f -ls -delete"
alias pkey="pbcopy < ~/.ssh/id_rsa.pub"

## - TMUX -----------------------------------------------
alias tmux="TERM=screen-256color-bce tmux -2"
alias takeover="tmux detach -a"

alias tgum="tmux attach-session -t gumshoe"
alias ttru="tmux attach-session -t trucoin"
alias tiso="tmux attach-session -t isotope"
alias tpto="tmux attach-session -t uspto"
alias tomni="tmux attach-session -t omniscient"
alias t="tmux attach-session -t std"
alias teamgum="cd ~ && teamocil --here gumshoe"
alias teamtru="cd ~ && teamocil --here trucoin"
alias teamiso="cd ~ && teamocil --here isotope"
alias teampto="cd ~ && teamocil --here uspto"
alias teamomni="cd ~ && teamocil --here omniscient"
alias team="cd ~ && teamocil --here std"

## - BREW -----------------------------------------------
alias b="brew"

## - PYTHON -----------------------------------------------
alias py="python"

## - VIM -----------------------------------------------
alias vim="/usr/local/bin/vim"
alias vi="vim"
alias vmi="vim"
alias v="vim"
alias vm="vim"
alias m="vim"
alias vundle="vim -c ':BundleInstall!' -c ':BundleClean' -c ':qa!'"
alias eclimd="/Applications/Eclipse/eclimd"

## - EDITS -----------------------------------------------
alias ez="vim ~/.zshrc"
alias eza="vim ~/.dotfiles/zsh/aliases.zsh"
alias ezf="vim ~/.dotfiles/zsh/functions.zsh"
alias vars="vim ~/.localrc"
alias ezl="vim ~/.localrc"
alias ezo="vim ~/.dotfiles/zsh/config.zsh"
alias eze="vim ~/.dotfiles/system/env.zsh"
alias ezp="vim ~/.dotfiles/system/path.zsh"
alias ezkb="vim ~/.dotfiles/zsh/keybindings.zsh"
alias ev="vim ~/.vimrc"
alias et="vim ~/.tmux.conf"
alias notes="~/Dropbox/notes/"
alias n="ruby ~/.dotfiles/bin/noter.rb"
alias last='ls *(.om[1])'

## - FOLDERS -----------------------------------------------
alias code="cd ~/code"
alias dev="cd ~/code"
alias music="cd ~/music/Audio"
alias sand="cd ~/code/sandbox"
alias repos="cd ~/code"
alias logs="cd ~/code/logs/"
alias docs="cd ~/Documents"
alias box="cd ~/Dropbox/"
alias dot="cd ~/.dotfiles"
alias dropbox="box"
alias utils="cd ~/Dropbox/Utils"
alias scripts="cd ~/Dropbox/scripts/"
# alias android="cd ~/Dropbox/Android/adb/"
alias adb="/Users/replicant/Dropbox/Android/adb/platform-tools/adb"
alias fastboot="/Users/replicant/Dropbox/Android/adb/platform-tools/fastboot"
alias dl="cd $HOME/Downloads/"
alias sbox="cd ~/code/sandbox/"
alias railsfiles="cd ~/Dropbox/scripts/rails_defaults/"
alias tip="cd ~/code/tipping"

alias cabin="cd ~/Isotope11/cabin_builder"
alias tru="cd ~/Isotope11/trucoin_rails"
alias gum="cd ~/Isotope11/gumshoe/frontend"
alias le="cd ~/Isotope11/Mayhem"
alias pto="cd ~/Isotope11/uspto"
alias uspto="cd ~/Isotope11/uspto"
alias usfe="cd ~/Isotope11/uspto/frontend/"
alias usapi="cd ~/Isotope11/uspto/api"
alias usdir="cd ~/Isotope11/uspto/dir_search"
alias tope="cd ~/Isotope11"
alias iso=tope
alias isoblog='cd ~/Isotope11/blog_posts'

## - POSTGRES -----------------------------------------------
alias startpg="pg_ctl -D /usr/local/var/postgres -l ~/code/logs/server.log start" #postgres -D /usr/local/var/postgres
alias stoppg="pg_ctl -D /usr/local/var/postgres -l ~/code/logs/server.log stop" #postgres -D /usr/local/var/postgres
alias pgstart="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pgstop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
  # To have launchd start postgresql at login:
  #     ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  # Then to load postgresql now:
  #     launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  # Or, if you don't want/need launchctl, you can just run:
  #     pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

alias pgsetup="sh ~/Dropbox/scripts/postgresql_db_setup.sh"

# alias server="python -m SimpleHTTPServer"
# alias srv=server
alias chromedebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --js-flags=--stack_trace_limit=-1 --user-data-dir=/tmp/jsleakcheck"
alias chrome32="open /Applications/Chromium.app"
alias c32=chrome32

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
# Thanks @sindersorhus: https://github.com/mathiasbynens/dotfiles/commit/bd9429af1cfdc7f4caa73e6f98773ed69a161c9c
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias dirsize="du -sh"
alias gumsolr="~/Isotope11/gumshoe/solr/solr.sh run"

alias jb="export JBOSS_HOME=""\$HOME/code/Isotope11/uspto/jboss""  && ~/Isotope11/uspto/jboss/bin/run.sh"
alias jb5="export JBOSS_HOME=""\$HOME/code/Isotope11/uspto/jboss5""  && ~/Isotope11/uspto/jboss5/bin/run.sh"
alias jb6="export JBOSS_HOME=""\$HOME/code/Isotope11/uspto/jboss6""  && ~/Isotope11/uspto/jboss6/bin/standalone.sh -b 0.0.0.0"
alias slr="sh ~/Isotope11/uspto/solr/localsolr.sh run"
alias mci="usapi && mvn package && cp ear/target/solrService.ear ../jboss/server/default/deploy && usfe"
# alias mci="cd ~/Isotope11/uspto/api && mvn clean install && usfe"

alias psgrep='ps auxwww | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
alias checkpg="psgrep postgres"
alias process="psgrep"
alias check=process
alias chk=process
alias running=process
alias proc=process

alias mg="mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf"
alias startred="redis-server /usr/local/etc/redis.conf"
alias redisstart="startred"
alias redstart="startred"
alias redcli="redis-cli"

alias ex=extract
alias rmrf="rm -rf .DS_Store .gitignore .rspec .rvmrc Gemfile GuardFile README.md"
alias sourcez="source ~/.zshrc"
alias srcz=sourcez
alias sz=sourcez
alias cls="clr && ls"
alias ip="ifconfig"
alias web="open -a '/Applications/Google Chrome.app' --args --disable-web-security"
alias get="curl -OL"
alias q="exit"
alias x="exit"
alias g="grep -r -i --color='auto'"
alias sirc="screen irssi"
alias wee="weechat-curses"
alias irc=weechat
alias ip="ipconfig getifaddr"
alias clr=clear
alias gn="python ~/.dotfiles/utils/geeknote/geeknote.py"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias syncoctoprint="scp pi@octopi.local:/home/pi/.octoprint/config.yaml /Users/replicant/Dropbox/3d/configs/octoprint"

## - ANDROID -----------------------------------------------
alias fb="moto-fastboot-osx64"

## - GIT -----------------------------------------------
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
alias gcom="git checkout master"
alias gcod="git checkout development"
alias gpom="git push origin master"
alias gpod="git push origin development"
alias gpum="git push upstream master"
alias gfo="git fetch origin"
alias gpo="git push origin"
alias gfom="git fetch && git merge origin/master"
alias gfod="git fetch && git merge origin/development" # will need to change this to origin/develop for NORMAL github repo setup
alias gfum="git fetch upstream && git merge upstream/master"
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

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
