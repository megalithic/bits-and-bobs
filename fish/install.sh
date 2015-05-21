brew install fish --HEAD
mkdir -p ~/.config
git clone https://github.com/rstacruz/fishfiles.git ~/.config/fish
# TODO: will eventually want to symlink this stuffs, i imagine i'll have changes to maintain via source control.

. ~/.config/fish/abbreviations.fish
# chsh -s /usr/local/bin/fish # make fish the default shell
