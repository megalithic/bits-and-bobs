#!/bin/sh
#
# Go

brew install go

mkdir $HOME/.go
go get golang.org/x/tools/cmd/vet
go get golang.org/x/tools/cmd/godoc
go get github.com/tools/godep
go get code.google.com/p/go.tools/cmd/goimports
go get github.com/smartystreets/goconvey

# get tags for go
go get -u github.com/jstemmer/gotags
