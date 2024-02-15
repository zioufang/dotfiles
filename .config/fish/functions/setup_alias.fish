## run setup_alias when new alias is created
function setup_alias
    ## git
    abbr -a g git
    abbr -a gr 'cd $(git rev-parse --show-toplevel)'
    abbr -a gc 'git clone'
    abbr -a gs 'git status -s'
    abbr -a gb 'git pull && git checkout -b'

    abbr -a b 'bat -p'

    abbr -a l clear

    abbr -a j 'cd (fd --type d --hidden --max-depth 3 --glob "**/.git" ~/projects | string replace "/.git" "" | fzf)'
    ## so many nvim
    abbr -a v nvim
    abbr -a n nvim
    abbr -a nv nvim .

    abbr -a lg lazygit
    abbr -a ld lazydocker
    abbr -a d docker
    abbr -a m make
    abbr -a c cargo
    abbr -a cm cargo make
    abbr -a md mdbook

    abbr -a pyvenv 'python3 -m venv .venv'
    abbr -a cx 'chmod +x'

    ## ls is an alias for exa
    abbr -a lsg "ls --git-ignore -I .git"

    ## k8s
    abbr -a k kubectl
    abbr -a kc kubectx
    abbr -a kn kubens

    ## WeaTher
    abbr -a wt 'curl "wttr.in?2q"'
    abbr -a wtg 'curl "v2.wttr.in"' # graph
end

## use `ctrl-space` to ignore abbr
