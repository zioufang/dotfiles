function tm --wraps tmux --description 'create or attach a session name (default `main`)'
    if test (count $argv) -eq 1
        set session_name $argv[1]
    else
        set session_name "main"
    end
    tmux attach -t $session_name || tmux new -s $session_name nvim
end
