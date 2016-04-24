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

# Interesting keybindings from "pjg"
# https://github.com/pjg/dotfiles/blob/master/.zshrc#L443
#
# alt + arrows
bindkey '[D' backward-word
bindkey '[C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

# ctrl + arrows
bindkey '^[OD' backward-word
bindkey '^[OC' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# home / end
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# delete
bindkey '^[[3~' delete-char

# page up / page down
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward

# shift + tab
bindkey '^[[Z' reverse-menu-complete


# These VI MODE bindings bring some emacs bindings to vi mode
# VI MODE KEYBINDINGS (ins mode)
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line
bindkey -M viins -s '^b' "←\n" # C-b move to previous directory (in history)
bindkey -M viins -s '^f' "→\n" # C-f move to next directory (in history)
bindkey -M viins '^k'    kill-line
bindkey -M viins '^r'    history-incremental-pattern-search-backward
bindkey -M viins '^s'    history-incremental-pattern-search-forward
bindkey -M viins '^o'    history-beginning-search-backward
bindkey -M viins '^p'    history-beginning-search-backward
bindkey -M viins '^n'    history-beginning-search-forward
bindkey -M viins '^y'    yank
bindkey -M viins '^w'    backward-kill-word
bindkey -M viins '^u'    backward-kill-line
bindkey -M viins '^h'    backward-delete-char
bindkey -M viins '^?'    backward-delete-char
bindkey -M viins '^_'    undo
bindkey -M viins '^x^l'  history-beginning-search-backward-then-append
bindkey -M viins '^x^r'  redisplay
bindkey -M viins '\eOH'  beginning-of-line # Home
bindkey -M viins '\eOF'  end-of-line       # End
bindkey -M viins '\e[2~' overwrite-mode    # Insert


# These VI MODE bindings bring some emacs bindings to vi mode
# VI MODE KEYBINDINGS (cmd mode)
bindkey -M vicmd 'ca'    change-around
bindkey -M vicmd 'ci'    change-in
bindkey -M vicmd 'da'    delete-around
bindkey -M vicmd 'di'    delete-in
bindkey -M vicmd 'ga'    what-cursor-position
bindkey -M vicmd 'gg'    beginning-of-history
bindkey -M vicmd 'G '    end-of-history
bindkey -M vicmd '^a'    beginning-of-line
bindkey -M vicmd '^e'    end-of-line
bindkey -M vicmd '^k'    kill-line
bindkey -M vicmd '^r'    history-incremental-pattern-search-backward
bindkey -M vicmd '^s'    history-incremental-pattern-search-forward
bindkey -M vicmd '^o'    history-beginning-search-backward
bindkey -M vicmd '^p'    history-beginning-search-backward
bindkey -M vicmd '^n'    history-beginning-search-forward
bindkey -M vicmd '^y'    yank
bindkey -M vicmd '^w'    backward-kill-word
bindkey -M vicmd '^u'    backward-kill-line
bindkey -M vicmd '/'     vi-history-search-forward
bindkey -M vicmd '?'     vi-history-search-backward
bindkey -M vicmd '^_'    undo
bindkey -M vicmd '\ef'   forward-word                      # Alt-f
bindkey -M vicmd '\eb'   backward-word                     # Alt-b
bindkey -M vicmd '\ed'   kill-word                         # Alt-d
bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
bindkey -M vicmd '\e[6~' history-beginning-search-forward  # PageDown
