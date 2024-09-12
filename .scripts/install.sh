#!/bin/bash

testing=false

function TMUX_SOURCE {
  tmux new-session -d -s "temp" ~/.dotfiles/.scripts/source_tmux.sh
  tmux kill-server
}

function LinkFile {
  sourcepath=$1                                   # e.g. /Users/<user>/.dotfiles/.config/nvim
  installpath=$( echo $1 | sed 's:/.dotfiles::' ) # e.g. /Users/<user>/.config/nvim
  filename=$( echo $1 | sed 's:.*/::' )           # e.g. nvim

  if [ $testing = true ]; then

    echo "Source Path:	$sourcepath"
    echo "Install Path:	$installpath"
    echo "Filename: 	$filename"

    [[ -L "$installpath" ]]                        && echo "Symbolic Link: FOUND" || echo "Symbolic Link: NOT FOUND"
    [[ -f "$installpath" && ! -L "$installpath" ]] && echo "File:          FOUND" || echo "File:          NOT FOUND"
    [[ -d "$installpath" && ! -L "$installpath" ]] && echo "Directory:     FOUND" || echo "Directory:     NOT FOUND"

    echo

    return
  fi

  if [ -L "$installpath" ]; then
    echo "Symbolic link already found for $installpath... skipping"
    return
  fi

  if [ -f "$installpath" ] || [ -d "$installpath" ]; then
    if [ -L ~/.config ]; then
      return
    fi
    mv "$installpath" "$installpath".bak
    echo "Your $installpath has been backed up as $installpath.bak"
  fi

  if [ "$file" = ".gitignore" ]; then
    return
  fi

  ln -s "$sourcepath" "$installpath"
}

if [ ! -d ~/.config ] && [ ! -L ~/.config ]; then
  mkdir ~/.config
fi

find ~/.dotfiles -maxdepth 1 -type f |
	while IFS= read -r line; do
		LinkFile "$line"
	done

find ~/.dotfiles/.config -maxdepth 1 -type d |
  while IFS= read -r line; do
    LinkFile "$line"
  done

if [ $testing == true ]; then
  exit 1
fi

cd ~/.dotfiles/
TMUX_SOURCE
~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
source ~/.bash_profile
git remote set-url origin https://ericdeering@github.com/ericdeering/.dotfiles.git
