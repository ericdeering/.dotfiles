#!/bin/bash

rm -rf ~/.config/tmux
rm -rf ~/.config/nvim
rm -rf ~/.dotfiles/
rm -i ~/.vimrc
rm -i ~/.bash_profile

cd ~
git clone https://github.com/ericdeering/.dotfiles.git

~/.dotfiles/.scripts/install.sh
