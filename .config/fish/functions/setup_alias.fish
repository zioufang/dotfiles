## run setup_alias when new alias is created
function setup_alias
    ## git
    abbr -a g git
    abbr -a gr 'cd $(git rev-parse --show-toplevel)'
    abbr -a gc 'git clone'
    abbr -a gs 'git status -s'
    abbr -a gb 'git pull && git checkout -b'

    abbr -a b 'bat -n'

    abbr -a v nvim
    abbr -a nv nvim .

    abbr -a lg lazygit
    abbr -a ld lazydocker
    abbr -a d docker
    abbr -a m make
    abbr -a md mdbook

    abbr -a pyvenv 'python3 -m venv .venv'
    abbr -a cx 'chmod +x'

    ## k8s
    abbr -a k kubectl
    abbr -a kc kubectx
    abbr -a kn kubens

    ## WeaTher
    abbr -a wt 'curl "wttr.in?2q"'
    abbr -a wtg 'curl "v2.wttr.in"' # graph
end

## use `ctrl-space` to ignore abbr
