

    git pull origin master;

# source file $1 to file $2, if $1 doesn't already exist in $2
function echo_source {
    ! grep -q "$1" $2 && echo "source $1" >> $2
}

function dotsync {
    # sync the dotfiles to home directory
    rsync --exclude "bootstrap.sh" \
        --exclude "bootstrap.zsh" \
        --exclude ".bash" \
        --exclude "README.md" \
        --exclude ".git/" \
        --exclude "vscode/" \
        -avh --no-perms . ~;


    bash .zsh/customs.sh

    echo_source "~/.shell/aliases.sh" ~/.zshrc;
    echo_source "~/.shell/functions.sh" ~/.zshrc;

    echo_source "~/.zshrc" ~/.zprofile;
    
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
