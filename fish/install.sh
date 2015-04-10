# Setup Fish as default shell and some other stuffs
echo ' -- Setting login shell to fish '
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

