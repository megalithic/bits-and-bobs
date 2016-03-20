typeset -g -A key # TODO: need to figure out what this is doing

# bindkey -e # use emacs key bindings # potentially breaking? first char gobbled on focus in zsh? remove to fix it, but lose the below bindings
# bindkey -v # use vi key bindings # potentially breaking? first char gobbled on focus in zsh? remove to fix it, but lose the below bindings

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

# FZF keybindings for completion
# https://github.com/junegunn/fzf/wiki/Fuzzy-completion
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
