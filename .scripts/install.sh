#!/bin/bash

function TMUX_SOURCE {
  tmux new-session -d -s "temp" ~/.dotfiles/.scripts/source_tmux.sh
  tmux kill-server
}

function LinkFile {
  file=$1
  echo "File: $file"
  if [ ! -L "~/$file" ]; then
    if [ -f "~/$file" ]; then
      mv "~/$file" "~/$file.bak"
      echo "Your ~/$file has been backed up as ~/$file.bak"
    fi
    ln -s ~/.dotfiles/"$file" ~/"$file"
  else
    echo "Symbolic link already found for ~/$file... skipping"
  fi
}

export -f LinkFile
find ~/.dotfiles -type f -depth 1 | sed 's:.*/::' |
	while IFS= read -r line; do
		LinkFile "$line"
	done

cd ~/.dotfiles/
TMUX_SOURCE
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
source ~/.bash_profile
git remote set-url origin main https://ericdeering@github.com/ericdeering/.dotfiles.git
