#!/bin/bash

function TMUX_SOURCE {
  tmux new-session -d -s "temp" ~/.dotfiles/.scripts/source_tmux.sh
}

function LinkFile() {
  file = $1
  if [ ! -L "~/$file" ]; then
    if [ -f "~/$file" ]; then
      mv "~/$file" "~/$file.bak"
      echo "Your $file has been backed up as $file.bak"
    fi
    ln -s "~/.dotfiles/$file" "~/$file"
  fi
}

find ~/.dotfiles -type f -depth 1 -exec LinkFile {} ';'
cd ~/.dotfiles/
TMUX_SOURCE
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server
source ~/.bash_profile
