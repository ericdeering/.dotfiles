alias ls="ls --color=auto"
alias gitf="~/.dotfiles/.scripts/git_push_fast.sh"
alias uninstall_config="~/.dotfiles/.scripts/uninstall_dotfiles.sh"
alias update_config="~/.dotfiles/.scripts/update_dotfiles.sh"
alias install_config="~/.dotfiles/.scripts/install.sh"
alias docker="sudo docker"
alias dup="docker compose up -d --force-recreate"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.nvm/nvm.sh

#changes color of user@host
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#stuff for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
