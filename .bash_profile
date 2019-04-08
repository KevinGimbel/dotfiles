#!/bin/bash

# Make sure .bashrc is loaded.
source ~/.bashrc
# Increase history size
export HISTSIZE=10000

# Program configs
export GREP_OPTIONS="$GREP_OPTIONS --color=auto"
# Up / Down arrow key for history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Quickly switch to a directory in my workspace.
function ws() {
  local workspace="${WS_WORKSPACE:=$HOME/Development}"
  # $1 is the target directory
  local target_dir="$1"
  depth=${WS_DEPTH:=3}
  # We start searching from the workspace dir
  cd $workspace
  # -maxdepth is the max directories to go "down"
  # head -n1 gives back the first result
  workspace_path=$(find . -maxdepth $depth -type d -name "*$target_dir*" | head -n1)
  if [  -z "$workspace_path" ]; then
    echo "Directory '$target_dir' not found. Changing to $workspace"
  else
    cd "$workspace_path"
  fi
}

function wsx() {
  oldPath=""
  workDir=""
  if [ "$1" == "-h" ]; then
    echo "wsx executes command in a workspace directory, then returns to the current directory"
    echo "Usage:"
    echo "wsx [workspace] [command [subcommand [arguments]]]"
    echo ""
    echo "Example"
    echo "wsx clientname docker-compose up -d"
    exit 0
  fi

  oldPath=$(pwd)
  workDir="$1"
  shift
  ws "$workDir" && eval "$@" && cd $oldPath
}

function myip() {
  curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
}

# Delete all merged branches
# https://stackoverflow.com/a/6127884/2777153
function git-remote-merged() {
  git branch --merged | egrep -v "(^\*|master|review)" | xargs git branch -d
}

export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

GO111MODULE=on

export PATH="$HOME/.cargo/bin:$PATH"

# Path to the bash it configuration
export BASH_IT="/Users/kevingimbel/.bash_it"

# custom function for powerline
source ~/.bash_it_custom/powerline-multiline/custom-prompt-funcs.sh
# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-multiline'
export POWERLINE_LEFT_PROMPT="scm cwd_short"
export POWERLINE_RIGHT_PROMPT="python_venv kubectl_context aws_profile clock user_info"
export POWERLINE_PROMPT_CHAR="λ"
# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
