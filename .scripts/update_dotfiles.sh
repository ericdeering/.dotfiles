#!/bin/bash

rm -rf ~/.config/tmux
rm -rf ~/.config/nvim
rm -rf ~/.dotfiles/

cd ~
git clone https://github.com/DukesMcSwagger/.dotfiles.git

~/.dotfiles/.scripts/install.sh
