function pyv
    deactivate

    # set path to venv to the first argv, or fallback to .venv
    # i.e. using `python` in ${venv}/bin
    set -l venv '.venv'
    set -gx _ZI_RIGHT_PROMPT_PYTHON_VENV (basename (pwd))
    if set -q argv[1]
        set -l venv $argv[1]
        set -gx _ZI_RIGHT_PROMPT_PYTHON_VENV (basename $argv[1])
    end

    set -gx VIRTUAL_ENV $(pwd)"/"$venv
    set -gx _OLD_VIRTUAL_PATH $PATH
    set -gx PATH "$VIRTUAL_ENV/bin" $PATH
    if set -q PYTHONHOME
        set -gx _OLD_VIRTUAL_PYTHONHOME $PYTHONHOME
        set -e PYTHONHOME
    end

    # display venv in right prompt
    functions -c fish_right_prompt _old_fish_right_prompt
    function fish_right_prompt
        set_color blue
        echo -n "["$_ZI_RIGHT_PROMPT_PYTHON_VENV"]"
        set_color normal
        _old_fish_right_prompt
    end

    set -gx _OLD_FISH_PROMPT_OVERRIDE "$VIRTUAL_ENV"
end

function deactivate -d "Exit python virtual environment and return to normal shell environment"
    # reset old environment variables
    if test -n "$_OLD_VIRTUAL_PATH"
        set -gx PATH $_OLD_VIRTUAL_PATH
        set -e _OLD_VIRTUAL_PATH
    end
    if test -n "$_OLD_VIRTUAL_PYTHONHOME"
        set -gx PYTHONHOME $_OLD_VIRTUAL_PYTHONHOME
        set -e _OLD_VIRTUAL_PYTHONHOME
    end

    if test -n "$_OLD_FISH_PROMPT_OVERRIDE"
        functions -e fish_right_prompt
        set -e _OLD_FISH_PROMPT_OVERRIDE
        functions -c _old_fish_right_prompt fish_right_prompt
        functions -e _old_fish_right_prompt
    end

    set -e VIRTUAL_ENV
end
