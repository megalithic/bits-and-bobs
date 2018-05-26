#!/bin/zsh

platform="unknown"

if [[ "$(uname)" == "Darwin" ]]; then
  platform="macos"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
  platform="linux"
elif [[ "$(expr substr $(uname -s) 1 5)" == 'FreeBSD' ]]; then
  platform='freebsd'
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
  platform="windows"
fi

export PLATFORM=$platform

echo "platform=$platform"
echo "PLATFORM=$PLATFORM"

