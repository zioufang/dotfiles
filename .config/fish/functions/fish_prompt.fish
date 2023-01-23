## disable the python venv prompt created by running `activate.fish`
## the added prompt ruins the new line
set -g VIRTUAL_ENV_DISABLE_PROMPT true


function fish_prompt
    set -lx prompt_sep ""
    set -lx bgcolor green

    function __prompt_vi_indicator
        if [ $fish_key_bindings = fish_vi_key_bindings ]
            switch $fish_bind_mode
                case insert
                    set_color black -b blue
                    echo -n "[I]"
                    set_color blue -b $bgcolor
                    echo -n $prompt_sep
                case default
                    set_color black -b magenta
                    echo -n "[N]"
                    set_color magenta -b $bgcolor
                    echo -n $prompt_sep
                case visual
                    set_color black -b yellow
                    echo -n "[S]"
                    set_color yellow -b $bgcolor
                    echo -n $prompt_sep
                case replace
                    set_color black -b blue
                    echo -n "[R]"
                    set_color blue -b $bgcolor
                    echo -n $prompt_sep
            end
            set_color normal -b normal
        end
    end

    if test -n "$__ZI_PROMPT_STARTED"
        echo ""
    else
        set -gx __ZI_PROMPT_STARTED true
    end
    __prompt_vi_indicator
    # echo -n doesn't add new line
    # prompt_pwd: https://fishshell.com/docs/current/cmds/prompt_pwd.html#cmd-prompt-pwd
    # set_color $bgcolor
    # echo -n ""
    set_color black -b $bgcolor
    echo -n " "(prompt_pwd --full-length-dirs=4)" "
    set_color $bgcolor -b normal
    echo -n $prompt_sep

    if set -l branch (git branch --show-current 2>/dev/null)
        # change branch color based on git status
        set -l g_status (git status -s)
        if test -n "$g_status"
            set_color red
        else
            set_color cyan
        end
        echo -n "    "$branch

        # check local is behind and ahead of upstream
        # need to run `git fetch` to get the latest remote info
        # set -l upstream_diff (git rev-list --count --left-right @{upstream}...HEAD)
        # set -l behind (echo $upstream_diff | cut -w -f 1)
        # set -l ahead (echo $upstream_diff | cut -w -f 2)
        # if test $behind -gt 0
        #     set_color red
        #     echo -n " "$behind
        # end
        # if test $ahead -gt 0
        #     set_color yellow
        #     echo -n " "$ahead
        # end
    end

    # new line prompt
    echo ""

    set_color yellow -b normal
    echo -n "   "
    set_color normal -b normal
end
