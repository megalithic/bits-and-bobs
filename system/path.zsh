# export PATH="./bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/local/sbin:$HOME/.sfs:$ZSH/bin:/Developer/adb-tools:/usr/local/share/npm/bin:$HOME/Development/repos/depot_tools:$HOME/Dropbox/Development/android/adt-bundle-mac-x86_64-20130917/sdk/tools:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/share/python:$PATH"


export PATH=/usr/local/lib/node_modules:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$HOME/.dotfiles/bin:$PATH

export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# remove duplicates from PATH.
typeset -U PATH
