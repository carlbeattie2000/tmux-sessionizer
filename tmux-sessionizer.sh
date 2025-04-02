# !/bin/bash

HOME=~/
PERSONAL=~/personal
CONFIG=~/.config

tmux-active() {
  tmux_running=$(pgrep tmux)
  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    false
  else
    true
  fi
}

switch-session() {
  if [[ -z $TMUX ]]; then
    tmux attach-session -t $1
  else
    tmux switch-client -t $1
  fi
}

has-session() {
  tmux list-sessions | grep -q "^$1:"
}

# Populate tmux session with windows
# Window 1 -> nvim
# Window 2 -> long running processes
# Window 3 -> cmd eg. git
# Window 4 -> extras / spare
create-windows() {
  tmux rename-window -t $1:1 'nvim'
  tmux send-keys -t $1:1 'vim .' C-m

  tmux new-window -t $1 -n 'long-running'
  tmux new-window -t $1 -n 'cmd'
  tmux new-window -t $1 -n 'exta'

  tmux select-window -t $1:1
}

session_dir=$(find $HOME $PERSONAL $CONFIG -mindepth 1 -maxdepth 1 -type d | fzf)
if [[ -z $session_dir ]]; then
  exit 0
fi
session_name=$(basename "$session_dir" | tr . _)

if ! tmux-active; then
  tmux new-session -s $session_name -c $session_dir
  create-windows $session_name
  exit 0
fi

if ! has-session $session_name; then
  tmux new-session -ds $session_name -c $session_dir
  create-windows $session_name
fi

switch-session $session_name
