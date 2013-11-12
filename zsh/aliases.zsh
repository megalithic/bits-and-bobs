# delete symlinks (remove evertyhing after '*' to just search for symlinks): find /home -maxdepth 1 -lname '*' -exec rm {} \;
# create the target folder and move the source to the new destination: mkdir -p ~/.dotfiles/git/bak && mv git* "$_"

# alias top="htop"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dirs="ls *(/)"
alias ff="ffind"
alias f="ffind"
alias files="find . -type f | wc -l"
alias a="ack"
alias new="print -rl -- **/*(Dom[1,5])"
# alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
# alias ll='ls -GFhl' # Same as above, but in long listing format
# alias lsd='ls -aFhlG'

## - TMUX -----------------------------------------------
# alias mux="tmux"
# alias tmx="tmux"
# alias tm="tmux"
alias tgum="tmux attach-session -t gumshoe"
alias ttru="tmux attach-session -t trucoin"
alias tiso="tmux attach-session -t isotope"
alias teamgum="cd ~ && teamocil --here gumshoe"
alias teamtru="cd ~ && teamocil --here trucoin"
alias teamiso="cd ~ && teamocil --here isotope"

## - BREW-----------------------------------------------
alias b="brew"

## - VIM -----------------------------------------------
alias e="vim"
# alias e="mvim -v"
alias vi="vim"
alias v="vim"
alias vm="vim"
alias vundle="vim -c ':BundleInstall!' -c ':BundleClean' -c ':qa!'"
alias eclimd="/Applications/Eclipse/eclimd"

## - EDITS -----------------------------------------------
alias ez="vim ~/dotfiles/zsh/zshrc"
alias eza="vim ~/dotfiles/zsh/aliases.zsh"
alias ezp="vim ~/dotfiles/zsh/plugins.zsh"
alias ezo="vim ~/dotfiles/zsh/setopt.zsh"
alias ezf="vim ~/dotfiles/zsh/functions.zsh"
alias vars="vim ~/dotfiles/zsh/envvars.zsh"
alias eze="vim ~/dotfiles/zsh/exports.zsh"
alias ezkb="vim ~/dotfiles/zsh/keybindings.zsh"
alias ev="vim ~/dotfiles/vim/vimrc"
alias evkb="vim ~/dotfiles/vim/vimrc.keybindings.vim"
alias et="vim ~/dotfiles/tmux/tmux.conf"
alias etgum="vim ~/dotfiles/tmux/teamocil/gumshoe.yml"
alias ettru="vim ~/dotfiles/tmux/teamocil/trucoin.yml"

## - FOLDERS -----------------------------------------------
alias dev="cd ~/Development/"
alias music="cd ~/music/Audio"
alias sand="cd ~/Development/sandbox"
alias repos="cd ~/Development/repos"
alias logs="cd ~/Development/logs/"
alias docs="cd ~/Documents"
alias box="cd ~/Dropbox/"
alias dot="cd ~/dotfiles"
alias dropbox="box"
alias utils="cd ~/Dropbox/Utils"
alias scripts="cd ~/Dropbox/scripts/"
# alias android="cd ~/Dropbox/Android/adb/"
alias adb="/Users/replicant/Dropbox/Android/adb/platform-tools/adb"
alias fastboot="/Users/replicant/Dropbox/Android/adb/platform-tools/fastboot"
alias dl="cd $HOME/Downloads/"
alias sbox="cd ~/Development/sandbox/"
alias trav="cd ~/Development/traverse.io/"
alias railsfiles="cd ~/Dropbox/scripts/rails_defaults/"

alias cabin="cd ~/Isotope11/cabin_builder"
alias tru="cd ~/Isotope11/trucoin_rails"
alias gum="cd ~/Isotope11/gumshoe/frontend"
alias le="cd ~/Isotope11/Mayhem"
alias pto="cd ~/Isotope11/uspto"
alias usfe="cd ~/Isotope11/uspto/USPTO_dir_frontend/20926"
alias usapi="cd ~/Isotope11/uspto/USPTO_dir_api"
alias usdir="cd ~/Isotope11/uspto/dir_search"
alias tope="cd ~/Isotope11"
alias iso=tope
alias isoblog='cd ~/Isotope11/blog_posts'
alias arlo="cd ~/Isotope11/mrarlo.com/"
alias sec="cd ~/Isotope11/sec_quiz"
alias zig="cd ~/Isotope11/att-zig-web"

## - POSTGRES -----------------------------------------------
alias startpg="pg_ctl -D /usr/local/var/postgres -l ~/Development/logs/server.log start" #postgres -D /usr/local/var/postgres
alias stoppg="pg_ctl -D /usr/local/var/postgres -l ~/Development/logs/server.log stop" #postgres -D /usr/local/var/postgres
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

alias dirsize="du -sh"
alias gumsolr="~/Isotope11/gumshoe/solr/solr.sh run"

alias jb="~/Isotope11/uspto/jboss/bin/run.sh"
alias slr="sh ~/Isotope11/uspto/dir_search/solr/localsolr.sh run"
alias mci="usapi && mvn package && cp ear/target/solrService.ear ../jboss/server/default/deploy && usfe"
# alias mci="cd ~/Isotope11/uspto/USPTO_dir_api && mvn clean install && usfe"

alias checkpg="ps auxwww | grep postgres"
alias process="ps auxwww | grep"
alias check=process
alias chk=process
alias running=process
alias proc=process
alias die="sudo pkill -9 -f"

alias mg="mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf"
alias startred="redis-server /usr/local/etc/redis.conf"
alias redisstart="startred"
alias redstart="startred"
alias redcli="redis-cli"

alias rmrf="rm -rf .DS_Store .gitignore .rspec .rvmrc Gemfile GuardFile README.md"
alias sourcez="source ~/.zshrc"
alias srcz=sourcez
alias sz=sourcez
alias ls="ls -Gah"
alias l="ls -ahg"
alias cls="clr && ls"
alias ip="ifconfig"
alias web="open -a '/Applications/Google Chrome.app' --args --disable-web-security"
alias get="curl -O"
alias ex="exit"
alias q="exit"
alias x="exit"
alias g="grep -r -i --color='auto'"
alias sirc="screen irssi"
alias wee="weechat-curses"
alias irc=weechat
alias ip="ipconfig getifaddr"
alias clr=clear
alias gn="python ~/dotfiles/utils/geeknote/geeknote.py"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

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
alias gcod="git checkout develop"
alias gpom="git push origin master"
alias gpod="git push origin develop"
alias gpum="git push upstream master"
alias gfo="git fetch origin"
alias gpo="git push origin"
alias gfom="git fetch origin && git merge origin/master"
alias gfod="git fetch origin && git merge origin/develop" # will need to change this to origin/develop for NORMAL github repo setup
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
alias rc="bundle exec rails console"
alias bec=rc
