#!/bin/bash

#
# Change preexec_functions to precmd_functions.
# This is so the $RUBY_* env vars are updated before the directory is changed
#
sed -i.bak s/preexec_functions/precmd_functions/g /usr/local/share/chruby/auto.sh
