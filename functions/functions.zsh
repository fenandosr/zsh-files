#
# Functions
#

# Automatically run ls when cd-ing into a directory
cd() {
    builtin cd $* && ls;
}

#Get IP
ip-addr() {
    wget -qO- http://ipecho.net/plain
    echo
}

# Time ZSH startup
zsh-time() {
    time zsh -i -c exit
}

# Run a command or multiple commands without saving it in the $HISTFILE
incognito() {
    if [ -z $EDITOR ]; then
        EDITOR=vim
    fi

    # Create temp for storing commands
    TEMPFILE=`mktemp -q incognito.XXXXXXXX`

    # Prompt for commands, only run if successful
    $EDITOR $TEMPFILE || {
        echo "Invalid return on the editing"
        return
    }

    # Run the script
    sh $TEMPFILE

    # Clean everything up
    rm -f $TEMPFILE
}

# uncompress depending on extension...
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)
                tar xvjf $1;;
            *.tar.gz)
                tar xvzf $1;;
            *.bz2)
                bunzip2 $1;;
            *.rar)
                unrar x $1;;
            *.gz)
                gunzip $1;;
            *.tar)
                tar xvf $1;;
            *.tbz2)
                tar xvjf $1;;
            *.tgz)
                tar xvzf $1;;
            *.zip)
                unzip $1;;
            *.Z)
                uncompress $1;;
            *.7z)
                7z x $1;;
            *)
                echo "'$1' cannot be extracted via >extract<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

mkcd() {
    mkdir -p $1
    cd $1
}

urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}

# For history on peco
# taken from here https://gist.github.com/nacyot/2c9151f2274ccad8bffc
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history

#
# OS Specific functions
#
if [[ $CURRENT_OS == 'OS X' ]]; then
    # OS X functions
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # Linux functions
    whattheduck() {
        # whattheduck <search_string>
        surf https://www.duckduckgo.com/`urlencode "$1"`
    }
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # Cygwin functions
fi

