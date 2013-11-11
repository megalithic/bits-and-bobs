#!/bin/sh

cli=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

$cli set repeat.wait 20
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set remap.controlDelete2forwarddelete 1
/bin/echo -n .
$cli set parameter.keyoverlaidmodifier_timeout 300
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set repeat.keyoverlaidmodifier_initial_wait 400
/bin/echo -n .
/bin/echo
