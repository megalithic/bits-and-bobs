#!/bin/sh

echo "installing python packages"

pip3 install --upgrade pip
./package-installer

echo "finished python setup"
