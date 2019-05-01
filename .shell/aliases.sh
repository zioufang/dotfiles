# easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# list out PATH
alias path='echo $PATH | tr -s ":" "\n"'

#
alias g=git
alias vi=vim
alias svim="sudo vim"
alias tgz="tar -zxvf"
alias tbz='tar -jxvf'
alias df="df -h"            # show disk space in mb instead of kb
alias wget="wget -c"        # enable resume downloads
alias ll="LC_COLLATE=C ls -lh --group-directories-first"     # readable ls, dotfiles first
alias ld="ll | grep '^d'"   # ls dir only
alias mkd="mkdir -pv"
alias s!="sudo !!"         # run sudo on the previous command
alias pyvenv="python3 -m venv venv"
alias pyv="source venv/bin/activate"

# get external ip
alias getip="curl ipinfo.io/ip"

# print the header (the first line of input)
# and then run the specified command on the body (the rest of the input)
# use it in a pipeline, e.g. ps | body grep somepattern
body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}
# top memory and cpu usage
# add '-<number>' to the end to change no. of rows
alias pscpu="ps auxf | body sort -nr -k 3 | head" 
alias psmem="ps auxf | body sort -nr -k 4 | head"

# search terminal history
alias hg="history | grep"

# DOCKER
# docker full prune
alias dprune="docker system prune --volumes -f"

# print the latest created container and then enter its bash
alias dbashl="docker ps -l && docker exec -it $(docker ps -l -q) bash"