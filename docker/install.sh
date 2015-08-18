# #!/bin/sh
# #
# # Docker
# # Getting started: http://viget.com/extend/how-to-use-docker-on-os-x-the-missing-guide
#
# # ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
# # launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
#
# # unset DYLD_LIBRARY_PATH;
# # unset LD_LIBRARY_PATH;
#
# # mkdir -p $HOME/.boot2docker
# # if [ ! -f $HOME/.boot2docker/boot2docker.iso ]
# # then
# #   cp /usr/local/share/boot2docker/boot2docker.iso ~/.boot2docker/
# # fi
#
# boot2docker init
# VBoxManage sharedfolder add boot2docker-vm -name home -hostpath /Users
# eval $(boot2docker shellinit)
# boot2docker up
#
# # Don't forget add to your ~/.zshrc
# export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
# export DOCKER_HOST=tcp://$(boot2docker ip):2376
#
# docker info
#
# # Common Docker issues, some of them documented here:
# # - "dial unix /var/run/docker.sock: no such file or directory"
# #     https://github.com/rvagg/dnt/issues/7
# # - "more debugging issues if `docker info` times out
# #     https://github.com/boot2docker/boot2docker/issues/672
#
