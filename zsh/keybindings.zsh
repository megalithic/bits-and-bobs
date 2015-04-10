typeset -g -A key # TODO: need to figure out what this is doing

bindkey -e # use emacs key bindings # potentially breaking? first char gobbled on focus in zsh? remove to fix it, but lose the below bindings
# bindkey -v # use vi key bindings # potentially breaking? first char gobbled on focus in zsh? remove to fix it, but lose the below bindings

## these don't seem to be working any longer
bindkey '^H' delete-word # iterm
bindkey '^[[3~' delete-char # tmux

bindkey '^[[1;9D' backward-word # iterm
bindkey '^[^[[D' backward-word # tmux os x

bindkey '^[[1;9C' forward-word # iterm
bindkey '^[^[[C' forward-word # tmux os x

bindkey '^[[H' beginning-of-line # iterm
bindkey '^[[1~' beginning-of-line # tmux

bindkey '^[[F' end-of-line # iterm
bindkey '^[[4~' end-of-line # tmux

# Key Remappings (Vi-mode)
# From: https://github.com/ajh17/dotfiles/blob/master/.zshrc#L150
# bindkey -v
# autoload -Uz edit-command-line
# zle -N edit-command-line
# zle -N ctrlp
#
# bindkey -M vicmd "/" history-incremental-pattern-search-forward
# bindkey -M vicmd "?" history-incremental-pattern-search-backward
# bindkey -M vicmd '^g' what-cursor-position
# bindkey -M vicmd '^r' redo
# bindkey -M vicmd 'G' end-of-buffer-or-history
# bindkey -M vicmd 'gg' beginning-of-buffer-or-history
# bindkey -M vicmd 'u' undo
# bindkey -M vicmd 'v' edit-command-line
# bindkey -M vicmd '~' vi-swap-case
# bindkey '^?' backward-delete-char
# bindkey '^[[A' history-search-backward
# bindkey '^[[B' history-search-forward
# bindkey '^[[Z' reverse-menu-complete
# bindkey '^a' vi-insert-bol
# bindkey '^_' run-help
# bindkey '^e' vi-add-eol
# bindkey '^k' kill-line
# bindkey '^l' clear-screen
# bindkey '^n' insert-last-word
# bindkey '^p' ctrlp
# bindkey '^r' history-incremental-search-backward
# bindkey '^s' history-incremental-search-forward
# bindkey '^u' vi-change-whole-line
