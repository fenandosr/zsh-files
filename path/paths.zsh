#
# Paths for all Computers
#

# Add the ~/bin/ directory for all users
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin/aws_completer

#
# OS Specific Paths
#

# OS X Aliases
if [[ $CURRENT_OS == 'OS X' ]]; then
    #
    # Prefixed Paths
    #

    # Prefix /usr/local/bin for brew
    export PATH=/usr/local/bin:$PATH

    #
    # Common paths
    #
    export PATH="/usr/local/opt/libxml2/bin:/usr/local/sbin:$PATH"
    #  MacPorts
    export PATH=$PATH:/opt/local/bin

elif [[ $CURRENT_OS == 'Linux' ]]; then
    # pyenv
    export PATH=$PATH:$HOME/.pyenv/bin
    # Go
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$HOME/go/bin
    export PATH=$PATH:$HOME/.local/bin
    export GOPATH=$HOME/go
    # Node Version Manager
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    # SDKMAN
    if [ -d "$HOME/.sdkman" ]
    then
        export SDKMAN_DIR="$HOME/.sdkman"
        [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    fi


    #
    # User Specific Aliases
    #
    if [[ $USER == 'none' ]]; then
        # none
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # none
fi
