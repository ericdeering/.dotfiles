#!/bin/bash

./uninstall_dotfiles.sh

cd ~
git clone https://github.com/ericdeering/.dotfiles.git

~/.dotfiles/.scripts/install.sh
