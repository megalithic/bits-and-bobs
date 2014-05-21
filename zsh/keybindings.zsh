# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a  
bindkey "^E"      end-of-line                          # ctrl-e
bindkey '^[[A'    up-line-or-search
bindkey '^[[B'    down-line-or-search
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
# bindkey "^D"      delete-char                          # ctrl-d
# bindkey "^F"      forward-char                         # ctrl-f
# bindkey "^B"      backward-char                        # ctrl-b
# bindkey "^[[3~"   delete-char                          # delete forward
# bindkey "^[3;5~"  delete-char                          # delete forward
# bindkey "\e[3~"  delete-char                          # delete forward
# bindkey '^[[1;5C' emacs-forward-word
# bindkey '^[[1;5D' emacs-backward-word
# bindkey -e   # Default to standard emacs bindings, regardless of editor string

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
# zle -N edit-command-line
# bindkey '^xe' edit-command-line
# bindkey '^x^e' edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# Use C-x C-e to edit the current command line
bindkey '\C-x\C-e' edit-command-line

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
bindkey '^N' history-search-backward
bindkey '^P' history-search-forward

# this makes the "delete" key work rather than
# just entering a ~
bindkey '\e[3~' delete-char

bindkey "^[B" backward-word
bindkey "^[F" forward-word

# these allow you to use ctrl+left/right arrow keys
# to jump the cursor over words, taken from:
# http://www.michael-noll.com/blog/2007/01/04/word-movement-shortcuts-for-iterm-on-mac-os-x/
# bindkey '\ef' forward-word
# bindkey '\eb' backward-word

bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
