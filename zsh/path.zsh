# PATHS
# ===========================================================================
if [ -x /usr/libexec/path_helper ]; then
  # Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

export GOPATH=$HOME/.go
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/lib/node_modules:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:$HOME/.dotfiles/bin"

# remove duplicates from PATH.
typeset -U PATH
