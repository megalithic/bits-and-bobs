#!/bin/sh
#
# Go

brew install go

mkdir $HOME/.go
go get golang.org/x/tools/cmd/vet
go get golang.org/x/tools/cmd/godoc

# get tags for go
go get -u github.com/jstemmer/gotags
