#
# Env Variables
#

# Making duckduckgo the default page (variable for lynx)
WWW_HOME='https://www.duckduckgo.com'
export WWW_HOME
export GOPATH=$HOME/go

#
# OS Specific Env Variables
#

if [[ $CURRENT_OS == 'OS X' ]]; then

elif [[ $CURRENT_OS == 'Linux' ]]; then
    export XDG_CACHE_HOME=$HOME/.cache
elif [[ $CURRENT_OS == 'Cygwin' ]]; then

fi
