## run setup_alias when new alias is created
function setup_alias
    ## git
    abbr -a g git
    abbr -a gr 'cd $(git rev-parse --show-toplevel)'
    abbr -a gc 'git clone'
    abbr -a gs 'git status'
    abbr -a gb 'git checkout -b'

    abbr -a b 'bat -n'

    abbr -a v nvim
    abbr -a nv nvim .

    abbr -a lg lazygit
    abbr -a d docker
    abbr -a m make

    abbr -a pyv 'source .venv/bin/activate.fish'
    abbr -a pyvenv 'python3 -m venv .venv'
    abbr -a cx 'chmod +x'

    ## k8s
    abbr -a k kubectl
    abbr -a kc kubectx
    abbr -a kn kubens
end

## use `ctrl-space` to ignore abbr
