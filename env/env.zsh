#
# Env Variables
#

# Making duckduckgo the default page
export WWW_HOME='https://www.duckduckgo.com'

#
# OS Specific Env Variables
#

if [[ $CURRENT_OS == 'OS X' ]]; then

elif [[ $CURRENT_OS == 'Linux' ]]; then
    export XDG_CACHE_HOME=$HOME/.cache
    export XDG_CONFIG_HOME=$HOME/.config
    #
    # User Specific
    #
    if [[ $USER == 'fenan' ]]; then
        export WINHOME="/mnt/c/User/fenan"
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then

fi
