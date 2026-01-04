if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
 ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias pn="pnpm"
alias lg="lazygit"
alias c="cursor"
alias cl="claude"
alias oc="opencode"
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

declare -A pomo_options
pomo_options["focus"]="30"
pomo_options["break"]="5"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias fo="pomodoro 'focus'"
alias br="pomodoro 'break'"

export PATH="${HOME}/.config/lsp/lua-language-server/bin:${PATH}"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/emorais/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# bun completions
[ -s "/home/emorais/.bun/_bun" ] && source "/home/emorais/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# deno
export DENO_INSTALL="/home/emorais/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# bun completions
[ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/home/emots/.opencode/bin:$PATH

export DISABLE_AUTO_UPDATE="true"

# Added by flyctl installer
export FLYCTL_INSTALL="/home/emots/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
