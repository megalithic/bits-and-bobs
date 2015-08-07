# Setup ZSH as default shell and some other stuffs
echo ' -- Setting login shell to zsh '
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh $USER

# to fix the issue described in the readme here:
# https://github.com/skalnik/vim-vroom
sudo cp ~/.dotfiles/zsh/zprofile.symlink /etc/zprofile
sudo cp ~/.dotfiles/zsh/zprofile.symlink /etc/zshenv

source ~/.dotfiles/zsh/zshrc.symlink
