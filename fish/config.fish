set -x SHELL /usr/local/bin/fish
set -U FZF_TMUX 1
set -U fish_key_bindings fish_vi_key_bindings

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# apps launching and such
alias mux="tmux"
alias vim="nvim"
alias updatenvim="brew update; pip3 install --upgrade neovim; chruby system; gem install neovim; nvim +PlugUpgrade +qall; nvim +PlugUpdate +qall; nvim +UpdateRemotePlugins +qall; cd -; wget https://raw.githubusercontent.com/pangloss/vim-javascript/master/indent/javascript.vim -O ~/.config/nvim/after/indent/javascript.vim; brew outdated"
alias nvimupdate="updatenvim"

# file edits
alias ev="vim ~/.dotfiles/nvim/init.vim"
alias ef="vim ~/.dotfiles/fish/config.fish"
alias sf="source ~/.dotfiles/fish/config.fish"
alias et="vim ~/.dotfiles/tmux/tmux.conf.symlink"
alias ez="vim ~/.dotfiles/zsh/zshrc.symlink"
alias sz="source ~/.zshrc"

# ruby/rails
alias be="bundle exec"
