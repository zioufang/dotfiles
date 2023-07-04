#!/usr/bin/env fish

## ENV VAR
export TERM=xterm-256color
export EDITOR=nvim
export GIT_TERMINAL_PROMPT=1 ## force git to prompt on terminal (e.g. HTTP cred)
export XDG_CONFIG_HOME="$HOME/.config" ## use ~/.config as config home for some app, e.g. lazygit
# export PATH=/opt/homebrew/bin:~/.local/bin:~/go/bin:~/.cargo/bin:$PATH ## this gives error 
fish_add_path -m /opt/homebrew/bin ~/.local/bin ~/go/bin ~/.cargo/bin

## KEYMAPS
## use `fish_key_reader` to find out the key sequence
## https://fishshell.com/docs/current/cmds/bind.html
bind --mode insert \cf forward-bigword # C-f
bind --mode insert \cE end-of-line
bind --mode insert \cA beginning-of-line
bind L end-of-line
bind H beginning-of-line
bind --mode insert --key up history-prefix-search-backward
bind --mode insert --key down history-prefix-search-forward
bind --mode insert \cN nextd-or-forward-word # A-n
bind --mode insert \cP prevd-or-backward-word # A-p
## TODO: map this to edit command in $EDITOR and run
bind --mode insert \cX\cE edit_command_buffer


## HACK until vi motion is implemented
## or use Alt-v or Alt-e to edit it in nvim
## https://github.com/fish-shell/fish-shell/issues/4019
bind d2w kill-word kill-word
bind d3w kill-word kill-word kill-word
bind d4w kill-word kill-word kill-word kill-word
bind d2W kill-bigword kill-bigword
bind d3W kill-bigword kill-bigword kill-bigword
bind d4W kill-bigword kill-bigword kill-bigword kill-bigword

# -m means run commands then goes into the new mode insert then repaint (refresh)
bind -s -m insert c2w kill-word kill-word repaint-mode
bind -s -m insert c3w kill-word kill-word kill-word repaint-mode
bind -s -m insert c4w kill-word kill-word kill-word kill-word repaint-mode
bind -s -m insert c2W kill-bigword kill-bigword repaint-mode
bind -s -m insert c3W kill-bigword kill-bigword kill-bigword repaint-mode
bind -s -m insert c4W kill-bigword kill-bigword kill-bigword kill-bigword repaint-mode

## FZF
export FZF_DEFAULT_OPTS='--reverse'
export FZF_DEFAULT_COMMAND="rg -g \"!.git/\" -g \"!venv/\" -g \"!vendor/\" --hidden --files"

## ZOXIDE
zoxide init fish --cmd j | source


function fish_right_prompt
    # show command duration for 'slow' command
    if test $CMD_DURATION -gt 1000
        set -l duration ""
        if test $CMD_DURATION -lt 60000
            # Show duration of the last command in seconds
            set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.1fs", $1 / $2}')
        else if test $CMD_DURATION -lt 3600000
            set duration (echo "$CMD_DURATION 60000" | awk '{printf "%.1fm", $1 / $2}')
        else
            set duration (echo "$CMD_DURATION 3600000" | awk '{printf "%.1fh", $1 / $2}')
        end
        set_color yellow
        echo "神"$duration
    end
end

# suppress vi mode indicator
# reimplemented in fish_prompt.fish
function fish_mode_prompt
end

## remove vi indicator
# function fish_mode_prompt; end
## remove welcome message
function fish_greeting
end

## default to vi bindings
fish_vi_key_bindings
set -g fish_vi_force_cursor 1
set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
# set -g fish_cursor_visual line

## work stuff
work_env
