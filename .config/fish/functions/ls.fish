function ls --wraps=exa
    # if which exa &>/dev/null
    ## --git-ignore -I .git
    exa --icons -a --group-directories-first $argv
    # else # fallback to normal ls
    #     set wls (which ls)
    #     $wls --color=always
    # end
end
