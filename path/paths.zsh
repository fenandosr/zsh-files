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

    # Rbenv
    export PATH=~/.rbenv/shims:$PATH

    #
    # Normal Paths
    #

    # MIT-Scheme
    export MITSCHEME_LIBRARY_PATH=/usr/local/lib/mit-scheme-c/
    #  MacPorts
    export PATH=$PATH:/opt/local/bin
    #  Add the bin/Mac directory
    export PATH=$PATH:~/bin/Mac
    # Add all npm packages
    export PATH=$PATH:/usr/local/share/npm/bin
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"
    # Others
    export PATH="/usr/local/opt/libxml2/bin:/usr/local/opt/python/libexec/bin:/usr/local/sbin:$PATH"


elif [[ $CURRENT_OS == 'Linux' ]]; then

    # pyenv
    export PATH=$PATH:$HOME/.pyenv/bin


    # Go's Path
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$HOME/go/bin
    export PATH=$PATH:$HOME/.local/bin

    # Path for selenium webdriver
    export PATH=$PATH:/opt/webdriver

    # Path for snaps
    export PATH=$PATH:/snap/bin

    NODEVERSION=v10.16.0
    NODEDISTRO=linux-x64

    #
    # User Specific Aliases
    #
    if [[ $USER == 'xxxxx' ]]; then
        # Home Linux
    elif [[ $USER == 'rogue' ]]; then
        # Work Linux

        # Android SDK Tools
        #export PATH=$PATH:~/Programming/SDKs/tools
        # Android SDK Platform Tools
        #export PATH=$PATH:~/Programming/SDKs/platform-tools
        # Jars
        #export PATH=$PATH:~/jars
        export PATH=/usr/local/lib/nodejs/node-$NODEVERSION-$NODEDISTRO/bin:$PATH
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # nothing yet
fi
