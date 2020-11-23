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
    # Common paths
    #
    export PATH="/usr/local/opt/libxml2/bin:/usr/local/sbin:$PATH"
    # MIT-Scheme
    export MITSCHEME_LIBRARY_PATH=/usr/local/lib/mit-scheme-c/
    #  MacPorts
    export PATH=$PATH:/opt/local/bin
    # Add all npm packages
    export PATH=$PATH:/usr/local/share/npm/bin
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

elif [[ $CURRENT_OS == 'Linux' ]]; then
    # pyenv
    export PATH=$PATH:$HOME/.pyenv/bin

    # Go
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$HOME/go/bin
    export PATH=$PATH:$HOME/.local/bin

    # Selenium webdriver
    export PATH=$PATH:/opt/webdriver

    # Linuxbrew
    export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

    #
    # User Specific Aliases
    #
    if [[ $USER == 'xxxxx' ]]; then
        # Home Linux
    elif [[ $USER == 'rogue' ]]; then
        # Work Linux
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # nothing yet
fi
