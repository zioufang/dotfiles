
git pull origin master;

# source file $1 to file $2, if $1 doesn't already exist in $2
function echo_source {
    ! grep -q "$1" $2 && echo "source $1" >> $2
}

function dotsync {

    # only run this in new instance, i.e. file doesn't exist
    if [[ ! -f ".zsh/customs.sh" ]]; then
        sed -n -i -e "s/source \$ZSH\/oh-my-zsh.sh//g" ~/.zshrc; # removed, to be added the the end later
        bash .zsh/customs.sh;
        echo '
ZSH_THEME=common

plugins=(
    zsh-syntax-highlighting
    docker
)

source $ZSH/oh-my-zsh.sh
' >> ~/.zshrc;


    # sync the dotfiles to home directory
    rsync --exclude "bootstrap.sh" \
        --exclude "bootstrap.zsh" \
<<<<<<< HEAD
=======
        --exclude ".config/bash/" \
>>>>>>> 800e503fe21a13f0eaaadca3147db34e189f17f5
        --exclude "README.md" \
        --exclude ".git/" \
        -avh --no-perms . ~;

    echo_source "~/.shell/aliases.sh" ~/.zshrc;
    #echo_source "~/.shell/funcs.sh" ~/.zshrc;
    


    source ~/.zshrc;

    echo "zsh dotfiles activated"
}

if [ "$1"=="-f" ]; then
    dotsync;
else
    read -p "this may overwrite existing files (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        dotsync;
    fi;
fi;
