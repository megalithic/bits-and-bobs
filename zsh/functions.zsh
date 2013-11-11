function zsh_recompile {
  autoload -U zrecompile
  rm -f ~/.zsh/*.zwc
  [[ -f ~/.zshrc ]] && zrecompile -p ~/.zshrc
  [[ -f ~/.zshrc.zwc.old ]] && rm -f ~/.zshrc.zwc.old

  for f in ~/.zsh/**/*.zsh; do
    [[ -f $f ]] && zrecompile -p $f
    [[ -f $f.zwc.old ]] && rm -f $f.zwc.old
  done

  [[ -f ~/.zcompdump ]] && zrecompile -p ~/.zcompdump
  [[ -f ~/.zcompdump.zwc.old ]] && rm -f ~/.zcompdump.zwc.old

  source ~/.zshrc
}

# credit: http://nparikh.org/notes/zshrc.txt
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function pg_start {
  /usr/local/bin/pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
}

function pg_stop {
  /usr/local/bin/pg_ctl -D /usr/local/var/postgres stop -s -m fast
}

function mysql_start {
  mysql.server start
}

function mysql_stop {
  mysql.server stop
}

function ss {
  if [ -e script/server ]; then
    script/server $@
  else
    script/rails server $@
  fi
}

function sc {
  if [ -e script/rails ]; then
    script/rails console $@
  else
    script/console $@
  fi
}

# shows me all files and folders when I change directories
cd() { builtin cd "$@"; ls -ahG }

# cd () {
#   if [[ -f "$1" ]]; then
#     builtin cd $(dirname "$1")
#   elif [[ "$1" == "" ]]; then
#     builtin cd; ls -ahG
#   else
#     builtin cd "$1"; ls -ahG
#   fi
# }

#http://blog.patshead.com/2012/11/improving-the-behavior-of-the-cd-command-in-git-repositories.html?r=related
# _git_cd() {
#   if [[ "$1" != "" ]]; then
#     cd "$@"
#   else
#     local OUTPUT
#     OUTPUT="$(git rev-parse --show-toplevel 2>/dev/null)"
#     if [[ -e "$OUTPUT" ]]; then
#       if [[ "$OUTPUT" != "$(pwd)" ]]; then
#         cd "$OUTPUT"
#       else
#         cd
#       fi
#     else
#       cd 
#     fi
#   fi
# }

# uses ~ instead of $HOME/
pwd() { print -D $PWD }

mcd() { mkdir -p $1 && cd $1 }
alias cdm=mcd

cdf() { cd *$1*/ } # stolen from @topfunky

port\?() { lsof -iTCP:$1 }

\?() { check $1 }

die() { sudo kill `ps -ef | grep $1 | grep -v grep | awk '{print $2}'` }

freplace() {find  . -type f | grep "$0" | xargs sed -i "" 's,$1\$,$2,'}

droppg() { dropdb $1_development && dropdb $1_test && dropuser $1 }

pg() { psql -d $1_development -U $1 }

run() { open -a "/Applications/$1.app" }

browserstack() { java -jar "/Users/replicant/Dropbox/scripts/BrowserStackTunnel.jar" M85ys4P3n6xEFGfcc1tQ localhost,$1,0 } #isotopeadmin: ozsSMrLsEacKuGM1yxLs #info@isotope11.com: M85ys4P3n6xEFGfcc1tQ

nginit() {
  cdm $1 && npm install generator-angular generator-testacular && yo angular && npm install && bower install --dev && npm install grunt-contrib-compass --save-dev
}

revert() {
  git reset $1 #resets index to former commit; replace '56e05fced' with your commit code
  git reset --soft HEAD@{1} #moves pointer back to previous HEAD
  git commit -m "Revert to $1"
  git reset --hard #updates working copy to reflect the new commit
}

dbmu() { rake db:migrate:up VERSION=$1 }

zman() { PAGER="less -g -s '+/^       "$1"'" man zshall }

unit() { rake add_unit_test[$1] }

function up() {
    local DIR=$PWD
    local TARGET=$1
    while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
        DIR=$(dirname $DIR)
    done
    test $DIR != "/" && echo $DIR/$TARGET
}

allhistory() {
  (cat $HOME/.zsh_history | sed -e 's/[^;]*;//' && cat $HOME/.allhistory) | sort | uniq > $HOME/.allhistory.new
  rm $HOME/.allhistory
  mv $HOME/.allhistory.new $HOME/.allhistory
}

findleaks() {
  if [[ -e "jsleakcheck.py" ]] then
    python jsleakcheck.py -d closure-disposable -v #--remote-inspector-client-debug
  else
    cd leak-finder/src
    python jsleakcheck.py -d closure-disposable -v #--remote-inspector-client-debug
  fi
}

psmem() { ps -C $1 -O rss | gawk '{ count ++; sum += $2 }; END {count --; print "Number of processes =",count; print "Memory usage per process =",sum/1024/count, "MB"; print "Total memory usage =", sum/1024, "MB" ;};' }

vpnc() {
/usr/bin/env osascript <<-EOF
  tell application "System Events"
    tell current location of network preferences
      set VPN to service "EXPeRT"
      if exists VPN then connect VPN
        repeat while (current configuration of VPN is not connected)
        delay 1
      end repeat
    end tell
  end tell
EOF
sudo /sbin/route delete -net 192.168.2.19 && sudo /sbin/route add -net 192.168.2.19 -interface ppp0
}

vpndc() {
/usr/bin/env osascript <<-EOF
  tell application "System Events"
    tell current location of network preferences
      set VPN to service "EXPeRT"
      if exists VPN then disconnect VPN
    end tell
  end tell
EOF
sudo /sbin/route delete -net 192.168.2.19
}

## - GIT -----------------------------------------------
capsha() { cap -S revision=$1 staging deploy }
sha() {
  git last | pbcopy
  capsha `pbpaste`
}


## - Complete in specific folders -----------------------------------------------
# d() { cd ~/Development/$1; }
# _d() { _files -W ~/Development -/; }
# compdef _d d

# i() { cd ~/Isotope11/$1; }
# _i() { _files -W ~/Isotope11 -/; }
# compdef _i i

# h() { cd ~/$1; }
# _h() { _files -W ~/ -/; }
# compdef _h h

# Log output:
#
# * 51c333e    (12 days)    <Gary Bernhardt>   add vim-eunuch
#
# The time massaging regexes start with ^[^<]* because that ensures that they
# only operate before the first "<". That "<" will be the beginning of the
# author name, ensuring that we don't destroy anything in the commit message
# that looks like time.
#
# The log format uses } characters between each field, and `column` is later
# used to split on them. A } in the commit subject or any other field will
# break this.

HASH="%C(yellow)%h%Creset"
RELATIVE_TIME="%Cgreen(%ar)%Creset"
AUTHOR="%C(bold blue)<%an>%Creset"
REFS="%C(red)%d%Creset"
SUBJECT="%s"

FORMAT="$HASH}$RELATIVE_TIME}$AUTHOR}$REFS $SUBJECT"

show_git_head() {
    pretty_git_log -1
    git show -p --pretty="tformat:"
}

pretty_git_log() {
    git log --graph --pretty="tformat:${FORMAT}" $* |
        # Replace (2 years ago) with (2 years)
        sed -Ee 's/(^[^<]*) ago\)/\1)/' |
        # Replace (2 years, 5 months) with (2 years)
        sed -Ee 's/(^[^<]*), [[:digit:]]+ .*months?\)/\1)/' |
        # Line columns up based on } delimiter
        column -s '}' -t |
        # Page only if we need to
        less -FXRS
}

# ============================================================================
# https://github.com/addyosmani/dotfiles/blob/master/.functions
# Need to convert his functions to zsh from bash
# ============================================================================
