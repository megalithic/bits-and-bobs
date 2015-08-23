# don't forget to source our function files (ext files not currently in this one)
source ~/.dotfiles/zsh/site-functions/*.zsh

function killport() {
  lsof -t -i tcp:$1 | xargs kill
}

function v() {
  rm ~/tmp/profile.log;
  vim $1 --startuptime ~/tmp/profile.log
}

# fkill - kill process
function fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# GIT Helpers
# ============================================================================
# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
    while out=$(
      git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
      fzf --ansi --no-sort --query="$q" --print-query \
          --expect=ctrl-d,ctrl-b);
    do
      q=$(head -1 <<< "$out")
      k=$(head -2 <<< "$out" | tail -1)
      sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
      [ -z "$sha" ] && continue
      if [ "$k" = 'ctrl-d' ]; then
        git diff $sha
      elif [ "$k" = 'ctrl-b' ]; then
        git stash branch "stash-$sha" $sha
        break;
      else
        git stash show -p $sha
      fi
    done
}
# fshow - git commit browser
fshow() {
  local out sha q
  while out=$(
      git log --decorate=short --graph --oneline --color=always |
      fzf --ansi --multi --no-sort --reverse --query="$q" --print-query); do
    q=$(head -1 <<< "$out")
    while read sha; do
      [ -n "$sha" ] && git show --color=always $sha | less -R
    done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
  done
}


function brewup() {
  brew update --verbose && brew outdated && brew upgrade && brew cleanup
}

function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

function remac {
  sudo /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z
  sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo networksetup -detectnewhardware
  echo $(ifconfig en0 | grep ether)
}

dockerip() {
  boot2docker ip 2> /dev/null
}

note () {
  if [ "$#" -ne 0 ] || [ "$1" = "-h" ] || [ "$1" = "–help" ]
  then
    echo "Usage: $0" >&2
    return 1
  fi

  # Fill these out with values you like.
  local tag_string=“draft”
  local notebook=“Sentinote”

  echo -n "What is the title of the post? "
  read title

  python /usr/local/bin/geeknote create \
  --title "${title}" \
  --tags “${tag_string}" \
  --notebook “${notebook}" \
  --content WRITE
}

pdfjoin() {
  join_py="/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"
  read "output_file?Name of output file > "
  "$join_py" -o $output_file $@ && open $output_file
}

chk() { grep $1 =(ps auxwww) }

path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
      sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
      sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
      sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
      sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
      sub(\"/.rvm\",  \"$fg_no_bold[red]/.rvm$reset_color\"); \
      print }"
}

tmateip () {
  output=$(tmate show-message | grep -m 1 "Remote session:")
  echo ${output#*session: } # display it
  echo ${output#*session: } | pbcopy # and copy it to clipboard
}

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

# make autocd do cd and ls:
# ref: https://bbs.archlinux.org/viewtopic.php?id=97980
# preexec() { LS_USED=$(echo $1|cut -d' ' -f1) }
# chpwd() {
#   case "$LS_USED" in
#     cd)     ls --color=auto --group-directories-first -hF;;
#     cdl)     ls --color=auto --group-directories-first -hlF;;
#     cda)     ls --color=auto --group-directories-first -hlAF;;
#     cdd)     ls --color=auto -d *(-/N);;
#     cdf)     ls --color=auto *(-.N);;
#     cdad)    ls --color=auto -d *(-/DN);;
#     cdaf)    ls --color=auto *(-.DN);;
#     cdbig)   ls --color=auto -lArSh;;
#     cdnew)   ls --color=auto -lAhrt;;
#     cdold)   ls --color=auto -lAht;;
#     cdsmall) ls --color=auto -lASh;;
#     *) ls --color=auto --group-directories-first -hF;;
#   esac
# }
# alias {cd,cda,cdl,cdd,cdf,cdad,cdaf,cdbig,cdnew,cdold,cdsmall}='builtin pushd'

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

freplace() {find  . -type f | grep "$0" | xargs sed -i "" 's,$1\$,$2,'}

droppg() { dropdb $1_development && dropdb $1_test && dropuser $1 }

pg() { psql -d $1_development -U $1 }

run() { open -a "/Applications/$1.app" }

browserstack() { java -jar "/Users/replicant/Dropbox/scripts/BrowserStackTunnel.jar" M85ys4P3n6xEFGfcc1tQ localhost,$1,0 } #isotopeadmin: ozsSMrLsEacKuGM1yxLs #info@isotope11.com: M85ys4P3n6xEFGfcc1tQ

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

# -------------------------------------------------------------------
# any function from http://onethingwell.org/post/14669173541/any
# search for running processes
# -------------------------------------------------------------------
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}

# ============================================================================
# https://github.com/addyosmani/dotfiles/blob/master/.functions
# Need to convert his functions to zsh from bash
# ============================================================================
# chrome() {
#   app="/Applications/Google Chrome 22.app/Contents/MacOS/Google Chrome"
#   userdatadir="/Users/replicant/Library/Application\ Support/Google/Chrome/$1"
#   (
#     ${app} --user-data-dir=${userdatadir} > /dev/null 2>&1;
#     #rm -r $1
#   ) &
# }



# ============================================================================
# FZF fun stuffs
# https://github.com/junegunn/fzf/wiki/examples
# ============================================================================
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# Equivalent to above, but opens it with `open` command
fo() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && open "$file"
}

# ============================================================================
# Cassandra stuffs (C*)
# ============================================================================
start_cassandra() {
  echo "proceeding with cassandra start with -p option to write pidfile"
  /usr/local/bin/cassandra -p /usr/local/bin/cassandra_pidfile.pid
}
stop_cassandra() {
  echo "proceeding with cassandra stop, will kill"
  cat /usr/local/bin/cassandra_pidfile.pid | awk '{print $1}' | xargs kill -9

  echo "checking for remaining cassandra processes... "
  ps aux | grep cassandra
}
tail_cassandra() {
  echo "tailing cassandra log at /usr/local/var/log/cassandra/system.log... "
  tail -f /usr/local/var/log/cassandra/system.log
}


# ============================================================================
# Chromecast stuffs
# ============================================================================
ccyt() {
  curl -H "Content-Type: application/json" \
    http://192.168.1.103:8008/apps/YouTube \
    -X POST \
    -d "v=$1";
}
ytsearch() {
  curl -s https://www.youtube.com/results\?search_query\=$@ | \
    grep -o 'watch?v=[^"]*"[^>]*title="[^"]*' | \
    sed -e 's/^watch\?v=\([^"]*\)".*title="\(.*\)/\1 \2/g'
}
