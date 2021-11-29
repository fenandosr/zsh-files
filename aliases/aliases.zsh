#
# Aliases for all
#

# Builtin aliases
alias ll='ls -AlF'
alias la='ls -a'

# Some cd aliases
alias back='cd -'

# ......
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'
alias ...........='cd ../../../../../../../../../../'
alias ............='cd ../../../../../../../../../../../'

# ZSH Global Aliases
alias -g L=' | less'
alias -g H=' | head -25'
alias -g T=' | tail -25'
alias -g NUL=' > /dev/null 2>&1'

# Alias Git
alias g='git'
alias gull='git pull'
alias gush='git push'

# Misc
alias jn='jupyter notebook'
alias itree='tree --prune -I $(cat .gitignore | egrep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|")'

#
# OS Specific Aliases
#
if [[ $CURRENT_OS == 'OS X' ]]; then
    #
    # OS X Aliases
    #

    # Hidden files
    alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
    alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'

    # Open from command line
    alias finder='open -a Finder '

elif [[ $CURRENT_OS == 'Linux' ]]; then
    #
    # Global Linux
    #

    # Misc Aliases
    alias inet='ip address | grep inet'

    # Images
    alias -s png=feh
    alias -s jpeg=feh
    alias -s jpg=feh
    alias -s gif=feh

    #
    # User Specific Aliases
    #

    if [[ $HOST == 'su' ]]; then
        # none
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # none
fi
