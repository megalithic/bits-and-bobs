#!/bin/sh
#
# Docker

brew install docker
brew install boot2docker

unset DYLD_LIBRARY_PATH;
unset LD_LIBRARY_PATH;

mkdir -p $HOME/.boot2docker
if [ ! -f $HOME/.boot2docker/boot2docker.iso ]
then
  cp /usr/local/share/boot2docker/boot2docker.iso ~/.boot2docker/
fi

boot2docker init
boot2docker up
$(boot2docker shellinit)
docker version

# Don't forget add to your ~/.zshrc
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://$(boot2docker ip):2376

# Common Docker issues, some of them documented here:
# - "dial unix /var/run/docker.sock: no such file or directory"
#     https://github.com/rvagg/dnt/issues/7
