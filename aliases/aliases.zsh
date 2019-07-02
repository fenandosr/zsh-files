#
# Aliases for all Computers
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
alias -g H=' | head -17'
alias -g T=' | tail -22'
alias -g NUL=' > /dev/null 2>&1'

# derp derp
alias mkdirp='mkdir -p'

# Alias Git
alias g='git'
alias gull='git pull'
alias gush='git push'

# Misc
alias jn='jupyter notebook'
alias td='thyme -d'

#
# OS Specific Aliases
#

# OS X Aliases
if [[ $CURRENT_OS == 'OS X' ]]; then
    # Hidden files
    alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
    alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'

    # Toogle location services
    alias 'kb-disable'='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'
    alias 'kb-enable'='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'

    # Oh
    alias rebuild-open-with='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed /Applications{,/Utilities}'
    alias inet='ifconfig | grep inet'

    # Journal Alias
    alias journal='vim ~/Documents/Journal/`date "+%Y"`/`date "+%B"`/`date "+%d-%A"`.md'

    #
    # Application aliases
    #
    alias ss='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine &'

    # Open from command line
    alias finder='open -a Finder '

elif [[ $CURRENT_OS == 'Linux' ]]; then
    #
    # Global Linux
    #

    # Misc Aliases
    alias ls='ls --color=auto'
    alias inet='ip address | grep inet'

    # Extensions
    alias -s avi=vlc
    alias -s html=$BROWSER
    alias -s pdf=epdfview
    alias -s txt=$EDITOR
    alias -s text=$EDITOR

    # Images
    alias -s png=feh
    alias -s jpeg=feh
    alias -s jpg=feh
    alias -s gif=feh

    # Source Extensions
    alias -s hs=$EDITOR
    alias -s c=$EDITOR



    #
    # User Specific Aliases
    #

    if [[ $HOST == 'rogue' ]]; then
        # Music Collection on julie
    alias julie-music='sudo mount -t cifs //42.111.1.85/fr/Music ~/Music -o user=fr'
    alias Archi='$HOME/Programs/Archi/Archi'

    elif [[ $HOST == 'julie' ]]; then

    elif [[ $HOST == 'su' ]]; then

    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    alias py='/cygdrive/c/Python27/python'
fi
