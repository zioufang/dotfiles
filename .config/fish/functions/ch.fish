function ch --description 'curl cht.sh for cheatsheets'
    set arg_cnt (count $argv)
    if [ $arg_cnt -lt 2 ]
        echo "Error: provide at least 2 args"
        return 1
    end

    if [ $argv[1] = "r" ]
        set lang "rust"
    else if [ $argv[1] = "p" ]
        set lang "python"
    else 
        set lang $argv[1]
    end

    set query (string join '+' $argv[2..$arg_cnt])

    echo "searching" $lang/$query

    curl cht.sh/$lang/$query
end
