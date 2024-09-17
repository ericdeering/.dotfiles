alias ls="ls --color=auto"
alias gitf="~/.dotfiles/.scripts/git_push_fast.sh"
alias uninstall_config="~/.dotfiles/.scripts/uninstall_dotfiles.sh"
alias update_config="~/.dotfiles/.scripts/update_dotfiles.sh"
alias install_config="~/.dotfiles/.scripts/install.sh"
alias dup="docker compose up -d --force-recreate"
alias dupf="~/.dotfiles/.scripts/docker-compose-container-init.sh"
alias gitc="git diff --name-only --diff-filter=U --relative"

# changes color of user@host
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  source ~/.nvm/nvm.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  autoload colors && colors
  PS1="%{$fg[green]%}%n@%{$fg[green]%}%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$ "
fi

# stuff for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias set_mouse_sense=SetMouseSense
alias read_mouse_sense="defaults read -g com.apple.mouse.scaling"

# set to 1 for a 400 dpi gaming mouse
function SetMouseSense() {
  if "$1" = "apple_mouse"; then
    ~/.dotfiles/.scripts/set_mouse_sensitivity.sh "0.375"
  else
    ~/.dotfiles/.scripts/set_mouse_sensitivity.sh "$1"
  fi
}

# import anaconda into $PATH
PATH=/opt/homebrew/anaconda3/bin:"$PATH"
