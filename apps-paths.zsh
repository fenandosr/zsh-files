#
# Paths and ENV VARS
#

# conda
if [ -d "$HOME/miniforge3/bin/" ]; then
    eval "$($HOME/miniforge3/bin/conda shell.zsh hook)"
fi

# pyenv
if [ -d "$HOME/.pyenv/bin" ]; then
    export PATH=$PATH:$HOME/.pyenv/bin
    eval "$(pyenv init -)"
fi

# julia
if [ -d "$HOME/.juliaup/bin" ]; then
    export PATH=$PATH/.juliaup/bin
fi

# Go
if [ -d "/usr/local/go/bin" ]; then
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$HOME/go/bin
    export GOPATH=$HOME/go
fi

# bun
if [ -d "$HOME/.bun/bin" ]; then
    export BUN_INSTALL=$HOME/.bun
    export PATH=$BUN_INSTALL/bin:$PATH
    [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
fi

# direnv
eval "$(direnv hook zsh)"

#
# OS Specific Paths
#
if [[ $OSTYPE == linux-gnu ]]; then

    # Node Version Manager
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    # SDKMAN
    if [ -d "$HOME/.sdkman" ]; then
        export SDKMAN_DIR="$HOME/.sdkman"
        [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    fi

    # Linux Homebrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

elif [[ $OSTYPE == darwin* ]]; then

    # brew
    export PATH=/opt/homebrew/bin:$PATH

    # Node Version Manager
    export NVM_DIR="${HOME}/.nvm"
    source $(brew --prefix nvm)/nvm.sh

    # OpenJDK
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

else
    if [[ $(uname -r) == *microsoft* ]]; then
        # wsl
    else
        #nothing
    fi
fi
