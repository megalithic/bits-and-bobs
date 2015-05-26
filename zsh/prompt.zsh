# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License

# ===========================================================================
# MODIFIED BY Seth Messer (@megalithic)
# ---------------------------------------------------------------------------
# Modifications include:
# - Added ruby version and gemset display
# - Modified PWD to truncate to first letter except for CWD
# ===========================================================================

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
#
# References:
# https://github.com/olivierverdier/zsh-git-prompt #robust dirty status
# https://github.com/marioizquierdo/git-branch-zsh-command #neat branch bin
# https://github.com/chrisfrazier0/pure/blob/master/pure.zsh #awesome pure mods

# ANSI COLORS!!11! http://misc.flogisoft.com/bash/tip_colors_and_formatting
# Shell prompt syntax: http://www.nparikh.org/unix/prompt.php
# ZSH prompt splicing, neat! http://radiumblue.net/blog/2013/04/29/zsh-prompt-spicing-up-the-present-working-directory/
# ZSH async! https://github.com/mafredri/zsh-async

autoload colors && colors
setopt PROMPT_SUBST

prompt_format_pwd() {
  local pwd="${PWD/#$HOME/~}"

  if [[ "$pwd" == (#m)[/~] ]]; then
    echo "$MATCH"
    unset MATCH
  else
    echo "${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}/${pwd:t}"
  fi
}

# turns seconds into human readable time
# 165392 => 1d 21h 56m 32s
prompt_pure_human_time() {
  local tmp=$1
  local days=$(( tmp / 60 / 60 / 24 ))
  local hours=$(( tmp / 60 / 60 % 24 ))
  local minutes=$(( tmp / 60 % 60 ))
  local seconds=$(( tmp % 60 ))
  (( $days > 0 )) && echo -n "${days}d "
  (( $hours > 0 )) && echo -n "${hours}h "
  (( $minutes > 0 )) && echo -n "${minutes}m "
  echo "${seconds}s"
}

# fastest possible way to check if repo is dirty
prompt_pure_git_dirty() {
	# check if we're in a git repo
	# command git rev-parse --is-inside-work-tree &>/dev/null || return
  [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
	# check if it's dirty
	[[ "$PURE_GIT_UNTRACKED_DIRTY" == 0 ]] && local umode="-uno" || local umode="-unormal"
	command test -n "$(git status --porcelain --ignore-submodules ${umode})"

	(($? == 0)) && echo '*'
}

# displays the exec time of the last command if set threshold was exceeded
prompt_pure_check_cmd_exec_time() {
  local stop=$EPOCHSECONDS
  local start=${prompt_pure_cmd_timestamp:-$stop}
  integer elapsed=$stop-$start
  (($elapsed > ${PURE_CMD_MAX_EXEC_TIME:=5})) && prompt_pure_human_time $elapsed
}

prompt_pure_check_git_arrows() {
  # check if there is an upstream configured for this branch
  command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

  local arrows=""
  (( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows='⇣'
  (( $(command git rev-list --left-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows+='⇡'
  # output the arrows
  [[ "$arrows" != "" ]] && echo " ${arrows}"
}

prompt_pure_preexec() {
  prompt_pure_cmd_timestamp=$EPOCHSECONDS

  # shows the current dir and executed command in the title when a process is active
  print -Pn "\e]0;"
  echo -nE "$PWD:t: $2"
  print -Pn "\a"
}

# string length ignoring ansi escapes
prompt_pure_string_length() {
  # Subtract one since newline is counted as two characters
  echo $(( ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[Bbkf])}} - 1 ))
}

prompt_pure_preprompt_render() {
  # check that no command is currently running, the prompt will otherwise be rendered in the wrong place
  [[ -n ${prompt_pure_cmd_timestamp+x} && "$1" != "precmd" ]] && return

  # set color for git branch/dirty status, change color if dirty checking has been delayed
  local git_color=242
  [[ -n ${prompt_pure_git_delay_dirty_check+x} ]] && git_color=red

  # construct prompt, beginning with path
  local prompt="%F{blue}$(prompt_format_pwd) %f"
  # git info
  prompt+="%F{$git_color}${vcs_info_msg_0_}${prompt_pure_git_dirty}%f"
  # git pull/push arrows
  prompt+="%F{cyan}${prompt_pure_git_arrows}%f"
  # username and machine if applicable
  prompt+=$prompt_pure_username
  # execution time
  prompt+="%F{yellow}${prompt_pure_cmd_exec_time}%f"

  # if executing through precmd, do not perform fancy terminal editing
  if [[ "$1" == "precmd" ]]; then
    print -P "\n${prompt}"
  else
    # only redraw if prompt has changed
    [[ "${prompt_pure_last_preprompt}" != "${prompt}" ]] || return

    # calculate length of prompt for redraw purposes
    local prompt_length=$(prompt_pure_string_length $prompt)
    local lines=$(( $prompt_length / $COLUMNS + 1 ))

    # disable clearing of line if last char of prompt is last column of terminal
    local clr="\e[K"
    (( $prompt_length * $lines == $COLUMNS - 1 )) && clr=""

    # modify previous prompt
    print -Pn "\e7\e[${lines}A\e[1G${prompt}${clr}\e8"
  fi

  # store previous prompt for comparison
  prompt_pure_last_preprompt=$prompt
}

prompt_pure_precmd() {
  # store exec time for when preprompt gets re-rendered
  prompt_pure_cmd_exec_time=$(prompt_pure_check_cmd_exec_time)

  # by making sure that prompt_pure_cmd_timestamp is defined here the async functions are prevented from interfering
  # with the initial preprompt rendering
  prompt_pure_cmd_timestamp=

  # check for git arrows
  prompt_pure_git_arrows=$(prompt_pure_check_git_arrows)

  # shows the full path in the title
  # print -Pn '\e]0;%~\a'
  print -Pn '\e]0;$(prompt_format_pwd)\a'

  # get vcs info
  vcs_info

  # preform async git dirty check and fetch
  prompt_pure_async_tasks

  # print the preprompt
  prompt_pure_preprompt_render "precmd"

  # remove the prompt_pure_cmd_timestamp, indicating that precmd has completed
  unset prompt_pure_cmd_timestamp
}

# prompt_pure_precmd() {
# 	# shows the full path in the title
#   print -Pn '\e]0;$(prompt_format_pwd)\a'
#   # print -Pn '\e]0;%~\a'
#
# 	# git info
# 	# vcs_info
#   # instead, we're using: https://github.com/yonchu/zsh-vcs-prompt # -> vcs_super_info
#
#   # local prompt_pure_preprompt="\n%F{blue}$(prompt_format_pwd) %f%{$fg[green]%}$(prompt_current_rvm)%f%F{242}$vcs_info_msg_0_%f%{$fg[red]%} $(prompt_pure_git_dirty)%f $prompt_pure_username%f %F{yellow}$(prompt_pure_cmd_exec_time)%f"
#   local prompt_pure_preprompt="\n%F{blue}$(prompt_format_pwd) %f$(vcs_super_info)%f $prompt_pure_username%f %F{yellow}$(prompt_pure_cmd_exec_time)%f"
#   print -P $prompt_pure_preprompt
#
#   # check async if there is anything to pull
# 	(( ${PURE_GIT_PULL:-1} )) && {
# 		# check if we're in a git repo
# 		[[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] &&
# 		# make sure working tree is not $HOME
# 		[[ "$(command git rev-parse --show-toplevel)" != "$HOME" ]] &&
# 		# check check if there is anything to pull
# 		command git fetch &>/dev/null &&
# 		# check if there is an upstream configured for this branch
# 		command git rev-parse --abbrev-ref @'{u}' &>/dev/null && {
# 			local arrows=''
# 			(( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows='⇣'
# 			(( $(command git rev-list --left-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows+='⇡'
# 			print -Pn "\e7\e[A\e[1G\e[`prompt_pure_string_length $prompt_pure_preprompt`C%F{cyan}${arrows}%f\e8"
# 		}
# 	} &!
#
# 	# reset value since `preexec` isn't always triggered
# 	unset cmd_timestamp
# }

# fastest possible way to check if repo is dirty
prompt_pure_async_git_dirty() {
  local untracked_dirty=$2
  local umode="-unormal"
  [[ "$untracked_dirty" == "0" ]] && umode="-uno"

  cd "$1"
  command test -n "$(git status --porcelain --ignore-submodules ${umode})"
  (($? == 0)) && echo "*"
}

prompt_pure_async_git_fetch() {
  cd "$1"

  # set GIT_TERMINAL_PROMPT=0 to disable auth prompting for git fetch (git 2.3+)
  GIT_TERMINAL_PROMPT=0 command git -c gc.auto=0 fetch
}

prompt_pure_async_tasks() {
  # initialize async worker
  ((!${prompt_pure_async_init:-0})) && {
    async_start_worker "prompt_pure" -u -n
    async_register_callback "prompt_pure" prompt_pure_async_callback
    prompt_pure_async_init=1
  }

  # get the current git working tree, empty if not inside a git directory
  local working_tree="$(command git rev-parse --show-toplevel 2>/dev/null)"

  # check if the working tree changed, it is prefixed with "x" to prevent variable resolution in path
  if [ "${prompt_pure_current_working_tree:-x}" != "x${working_tree}" ]; then
    # stop any running async jobs
    async_flush_jobs "prompt_pure"

    # reset git preprompt variables, switching working tree
    unset prompt_pure_git_dirty
    unset prompt_pure_git_delay_dirty_check

    # set the new working tree, prefixed with "x"
    prompt_pure_current_working_tree="x${working_tree}"
  fi

  # only perform tasks inside git working tree
  [[ "${working_tree}" != "" ]] || return

  # tell worker to do a git fetch
  async_job "prompt_pure" prompt_pure_async_git_fetch $working_tree

  # if dirty checking is sufficiently fast, tell worker to check it again, or wait for timeout
  local dirty_check=$(( $EPOCHSECONDS - ${prompt_pure_git_delay_dirty_check:-0} ))
  if (( $dirty_check > ${PURE_GIT_DELAY_DIRTY_CHECK:-1800} )); then
    unset prompt_pure_git_delay_dirty_check
    (( ${PURE_GIT_PULL:-1} )) &&
    # make sure working tree is not $HOME
    [[ "${working_tree}" != "$HOME" ]] &&
    # check check if there is anything to pull
    async_job "prompt_pure" prompt_pure_async_git_dirty $working_tree $PURE_GIT_UNTRACKED_DIRTY
  fi
}

prompt_pure_async_callback() {
  local job=$1
  local output=$3
  local exec_time=$4

  case "${job}" in
    prompt_pure_async_git_dirty)
      prompt_pure_git_dirty=$output
      prompt_pure_preprompt_render

      # when prompt_pure_git_delay_dirty_check is set, the git info is displayed in a different color, this is why the
      # prompt is rendered before the variable is (potentially) set
      (( $exec_time > 2 )) && prompt_pure_git_delay_dirty_check=$EPOCHSECONDS
      ;;
    prompt_pure_async_git_fetch)
      prompt_pure_git_arrows=$(prompt_pure_check_git_arrows)
      prompt_pure_preprompt_render
      ;;
  esac
}

# function zle-line-init zle-keymap-select {
#   vi_mode="${${KEYMAP/vicmd/%%}/(main|viins)/$}"
#   zle reset-prompt
# }

prompt_pure_setup() {
  # prevent percentage showing up
  # if output doesn't end with a newline
  export PROMPT_EOL_MARK=''

	prompt_opts=(cr subst percent)

  zmodload zsh/datetime
	autoload -Uz add-zsh-hook
	autoload -Uz vcs_info
  autoload -Uz vcs_super_info
  autoload -Uz async && async

	add-zsh-hook precmd prompt_pure_precmd
	add-zsh-hook preexec prompt_pure_preexec

  zle -N zle-line-init
  zle -N zle-keymap-select

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' use-simple true
  zstyle ':vcs_info:git*' formats ' %b'
  zstyle ':vcs_info:git*' actionformats ' %b|%a'

  # show username@host if logged in through SSH
  [[ "$SSH_CONNECTION" != '' ]] && prompt_pure_username=' %F{242}%n@%m%f'

  # show username@host if root, with username in white
  [[ $UID -eq 0 ]] && prompt_pure_username=' %F{white}%n%f%F{242}@%m%f'

	# prompt turns red if the previous command didn't exit with 0
  PROMPT='%(?.%F{green}.%F{red})%(!.❯.)❯%f '
  RPROMPT='%f%F{240}$RUBY_ENGINE-$RUBY_AUTO_VERSION%f%'
}

prompt_pure_setup "$@"
