#
# Env Variables
#

# Making duckduckgo the default page (variable for lynx)
WWW_HOME='https://www.duckduckgo.com'
export WWW_HOME

#
# OS Specific Env Variables
#

if [[ $CURRENT_OS == 'OS X' ]]; then
    # OS X Env Variables
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # Linux Env Variables
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # Cygwin Env Variables
fi
