#
# Functions
#

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


# Get the value of an alias.
#
# Arguments:
#    1. alias - The alias to get its value from
# STDOUT:
#    The value of alias $1 (if it has one).
# Return value:
#    0 if the alias was found,
#    1 if it does not exist
#
function alias_value() {
    alias "$1" | sed "s/^$1='\(.*\)'$/\1/"
    test $(alias "$1")
}


# uncompress depending on extension
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

# For history on peco
# https://gist.github.com/nacyot/2c9151f2274ccad8bffc
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
if [[ $OSTYPE == linux-gnu ]]; then
    #nothing
elif [[ $OSTYPE == darwin* ]]; then
    #nothing
else
    if [[ $(uname -r) == *microsoft* ]]; then
        # wsl
    else
        #nothing
    fi
fi
