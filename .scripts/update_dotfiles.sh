#!/bin/bash

rm -rf ~/.config/tmux
rm -rf ~/.config/nvim
rm -rf ~/.dotfiles/

git clone https://github.com/DukesMcSwagger/.dotfiles.git ~

./install.sh
