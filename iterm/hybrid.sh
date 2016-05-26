#!/bin/sh
# Shell colors for vim-hybrid - Shell color setup script
# Luan Santos (http://luansantos.com)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color017="00/00/5f"
color024="00/5f/5f"
color052="5f/00/00"
color053="5f/00/5f"
color060="d7/d7/ff"
color065="5F/87/5F"
color109="8a/be/b7"
color110="81/a2/be"
color139="b2/94/bb"
color143="b5/bd/68"
color167="cc/66/66"
color173="de/93/5f"
color189="5F/5F/87"
color193="d7/ff/af"
color221="f0/c6/74"
color234="1d/1f/21"
color235="28/2a/2e"
color236="30/30/30"
color237="37/3b/41"
color243="70/78/80"
color250="c5/c8/c6"

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 17  $color017
printf $printf_template 24  $color024
printf $printf_template 52  $color052
printf $printf_template 53  $color053
printf $printf_template 60  $color060
printf $printf_template 65  $color065
printf $printf_template 109 $color109
printf $printf_template 110 $color110
printf $printf_template 139 $color139
printf $printf_template 143 $color143
printf $printf_template 167 $color167
printf $printf_template 173 $color173
printf $printf_template 189 $color189
printf $printf_template 193 $color193
printf $printf_template 221 $color221
printf $printf_template 234 $color234
printf $printf_template 235 $color235
printf $printf_template 236 $color236
printf $printf_template 237 $color237
printf $printf_template 243 $color243
printf $printf_template 250 $color250

# clean up
unset printf_template
unset printf_template_var
unset color017
unset color024
unset color052
unset color053
unset color060
unset color065
unset color109
unset color110
unset color139
unset color143
unset color167
unset color173
unset color189
unset color193
unset color221
unset color234
unset color235
unset color236
unset color237
unset color243
unset color250
