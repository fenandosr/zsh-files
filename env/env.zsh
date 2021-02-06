#
# Env Variables
#

# Making duckduckgo the default page (variable for lynx)
WWW_HOME='https://www.duckduckgo.com'
export WWW_HOME
export GOPATH=$HOME/go

# OS Specific Env Variables
#

if [[ $CURRENT_OS == 'OS X' ]]; then
    # OS X Env Variables
    export ZSH_CACHE_DIR=$HOME/.zsh
    # less support for highlighting code
    export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"

elif [[ $CURRENT_OS == 'Linux' ]]; then
    # Linux Env Variables
    # less support for highlighting code
    # taken from here: https://superuser.com/questions/71588/how-to-syntax-highlight-via-less
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    export XDG_CACHE_HOME=$HOME/.cache
#
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # Cygwin Env Variables
fi
