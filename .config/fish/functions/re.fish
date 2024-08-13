function re --description 'retry a command until it runs'
    while true
        $argv 2>/dev/null
        if test $status -eq 0
            break
        else
            sleep 1
        end
    end
end
