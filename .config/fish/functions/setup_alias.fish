## run setup_alias when new alias is created
function setup_alias
    ## git
    abbr -a g git
    abbr -a gr 'cd $(git rev-parse --show-toplevel)'
    abbr -a gc 'git clone'
    abbr -a gs 'git status'

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
