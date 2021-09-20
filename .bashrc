# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux new-session -A -s main
fi


mkdir -p ~/.config/myzsh/

if [[ ! -e ~/.bash-it/ ]]; then
    git clone --depth=1 https://ghproxy.com/https://github.com/Bash-it/bash-it.git ~/.bash-it
fi

if [[ ! -e ~/.config/myzsh/autojump ]]; then
    git clone https://ghproxy.com/https://github.com/wting/autojump.git ~/.config/myzsh/autojump
    cd ~/.config/myzsh/autojump
    ./install.py
    cd -
fi

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh


# ===
# === PATH
# ===
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}
addToPATH ~/.cargo/bin
addToPATH /usr/local/go/bin
addToPATH ~/go/bin

# Path to the bash it configuration
export BASH_IT="/home/${USER}/.bash-it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='zork'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.zhlh6.cn'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
#export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
#export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

# ===
# === func
# ===
# ranger退出时跳转到在ranger里的目录
ranger () {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
    command
    ranger
    --cmd="map q chain shell echo %d > "$tempfile"; quitall!"
)

${ranger_cmd[@]} "$@"
if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
    cd -- "$(cat "$tempfile")" || return
fi
command rm -f -- "$tempfile" 2>/dev/null
}

# lazygit退出时跳转到在lazygit里的目录
# 如果不想跳转，可以用`shift + q`而不是`q`来退出
# function lg () {
#     export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
#
#     lazygit "$@"
#
#     if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
#         \cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
#         rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
#     fi
# }

# tmux_init () {
#     if [[ ! -d ~/.tmux || ! -f "${MYZSH}"/.lock/tmux.lock || ! -h ~/.tmux.conf ]]; then
#         cd
#         # Add tmux framework
#         if [[ ! -d ~/.tmux ]]; then
#             git clone https://hub.fastgit.org/gpakosz/.tmux.git ~/.tmux
#             # git clone https://hub.fastgit.org/Johnny4Fun/.tmux.git ~/.tmux
#         fi
#         touch "${MYZSH}"/.lock/tmux.lock
#         if [[ $(yay -Qeq | grep stow) == 1 ]]; then
#             yay -S stow
#         fi
#         ln -s -f .tmux/.tmux.conf ~/.tmux.conf
#         cd ~/.dotfiles/
#         stow -R tmux
#         tmux source-file ~/.tmux.conf
#     fi
# }
#
# # init tmux
# if [[ ! -f "${MYZSH}"/.lock/tmux.lock ]]; then
#     tmux_init
# fi


# ===
# === environment variables
# ===
export EDITOR=vim


# ===
# === aliases
# ===
alias gh='cd'

alias ll='ls -lah --color=always'
alias l='ls -lh --color=always'

alias ra='ranger'
alias t='tmux'
alias ta='tmux attach'
alias py='python'

alias :q='exit'

set -o vi

