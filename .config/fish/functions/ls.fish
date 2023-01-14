function ls --wraps=exa --description 'alias ls=exa --icons -a --group-directories-first --git-ignore -I **/.git'
    # if which exa &>/dev/null
    exa --icons -a --group-directories-first --git-ignore -I .git $argv
    # else # fallback to normal ls
    #     set wls (which ls)
    #     $wls --color=always
    # end
end
