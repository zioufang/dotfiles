fpath=("$HOME/.config/zsh/themes" "$fpath[@]")

autoload -Uz compinit promptinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
promptinit
_comp_options+=(globdots)

prompt common

setopt autocd
setopt autopushd
setopt pushdignoredups
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

# vi mode
bindkey -v
export KEYTIMEOUT=1

# ci"
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, di{ etc..
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '\e.' insert-last-word
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '\eOA' history-beginning-search-backward-end
bindkey '\eOB' history-beginning-search-forward-end

# edit line in vim with ctrl+v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

export DIRSTACKSIZE=5
alias d='dirs -v' \
    0='cd ~0' \
    1='cd ~1' \
    2='cd ~2' \
    3='cd ~3' \
    4='cd ~4'

export PATH=$PATH:~/.local/bin:~/go/bin
export HISTFILE=~/.cache/zsh/history
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

# sourcing
source ~/.config/shell/aliases.sh
source ~/.config/shell/funcs.sh

# addon scripts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/autojump/autojump.zsh
for file in ~/.config/zsh/completions/*; do source $file; done
