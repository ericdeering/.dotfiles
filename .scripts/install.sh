#!/bin/bash

function TMUX_SOURCE {
  tmux new-session -d -s "temp" ~/.dotfiles/.scripts/source_tmux.sh
}

cd ~/.dotfiles/
TMUX_SOURCE
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server
source ~/.bash_profile
