autoload -Uz compinit promptinit
compinit
promptinit

# ln -s ~/projects/dotfiles/.config/zsh/common.zsh-theme /usr/share/zsh/functions/Prompts/prompt_common_setup
prompt common

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt interactivecomments
setopt share_history

bindkey -v

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '\e.' insert-last-word

source ~/.config/shell/aliases.sh
source ~/.config/shell/funcs.sh

export DIRSTACKSIZE=5
alias d='dirs -v' \
    0='cd ~0' \
    1='cd ~1' \
    2='cd ~2' \
    3='cd ~3' \
    4='cd ~4'

export PATH=$PATH:~/.local/bin
export HISTSIZE=10000
export HISTFILESIZE=10000
export GIT_TERMINAL_PROMPT=1
export FZF_DEFAULT_COMMAND='fd --type f'
export TERM=xterm # for remote session

# beam for insert and block for normal
# smkx to fix keys like backspace/delete for st
zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        # the command mode for vi
        echo -ne "\e[2 q"
    else
        # the insert mode for vi
        echo -ne "\e[5 q"
    fi
}
zle -N zle-keymap-select

zle-line-init() {
    echoti smkx
    echo -ne "\e[5 q"
}
zle -N zle-line-init

zle-line-finish() {
    echoti rmkx
}
zle -N zle-line-finish

