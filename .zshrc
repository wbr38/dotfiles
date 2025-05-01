#!/usr/bin/env zsh

source ~/.shellrc

# Load vcs / git
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b'

# Function to update vcs_info before each prompt
precmd() { vcs_info }

# Define colors
RESET="%f"
GREEN="%F{2}"
YELLOW="%F{3}"
GOLD="%F{214}"
CYAN="%F{6}"
NEWLINE=$'\n'

USER_HOST="${GREEN}%n@%m"
LOCATION="${YELLOW}%~"

# Function to get the Git branch dynamically
get_git_branch() {
    if [[ -n $vcs_info_msg_0_ ]]; then
        echo " ${CYAN}(${vcs_info_msg_0_})"
    else
        echo ""
    fi
}

setopt PROMPT_SUBST
export PROMPT='${RESET}${USER_HOST} ${GOLD}[ ${LOCATION} ${GOLD}]$(get_git_branch) ${NEWLINE}${RESET}$ '
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# case insensitive path-completion
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Ctrl+Left / Ctrl+Right
bindkey $terminfo[kRIT5] forward-word
bindkey $terminfo[kLFT5] backward-word