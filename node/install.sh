#!/bin/sh

# installs yeoman, as well as grunt-cli and bower
npm install -g yo #or lineman
npm install -g protractor #used for e2e testing
npm install

# potential grunt addons (per project):
# npm install grunt-notify --save-dev

# potential grunt addons (global):
# npm install -g testem #used for unit testing (instead of karma with yo)