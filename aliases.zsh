#
# Aliases for all
#
# Builtin aliases
alias ll='ls -AlF'
alias la='ls -a'
# cd up
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
# ZSH Global Aliases
alias -g L=' | less'
alias -g H=' | head -25'
alias -g T=' | tail -25'
alias -g NUL=' > /dev/null 2>&1'
# Misc
alias itree='rg --files --hidden --ignore --glob "!.git/" "$@" | tree --fromfile -a'

#
# OS Specific Aliases
#
if [[ $OSTYPE == linux-gnu ]]; then
    #nothing
elif [[ $OSTYPE == darwin* ]]; then
    # Hidden files
    alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
    alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'
    # Open from command line
    alias finder='open -a Finder '
else
    if [[ $(uname -r) == *microsoft* ]]; then
        # wsl
    else
        #nothing
    fi
fi
