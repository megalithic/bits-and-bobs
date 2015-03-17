#!/bin/sh
#
# Go

brew install go
curl -o /usr/local/share/zsh/site-functions/go https://raw.githubusercontent.com/golang/go/1ec56062ef6b256f8269e2ca8c5477e3a917331a/misc/zsh/go
curl -o /usr/local/share/zsh/site-functions/godoc https://gist.githubusercontent.com/icholy/5320428/raw/1775b8c3b85b4a0ef95858afbf2e728c42b4ded0/_godoc

mkdir $HOME/.go
go get golang.org/x/tools/cmd/vet
go get golang.org/x/tools/cmd/godoc
go get github.com/tools/godep
go get golang.org/x/tools/imports
go get github.com/smartystreets/goconvey
go get golang.org/x/tools/cmd/cover
go get github.com/stretchr/testify/assert
go get -u github.com/derekparker/delve/cmd/dlv #https://github.com/derekparker/delve


# get tags for go
go get -u github.com/jstemmer/gotags

# symlink some useful things
ln -sfv $HOME/.go/src $HOME/code/go
