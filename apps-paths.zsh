#
# Paths and ENV VARS
#
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# Go
if [ -d "/usr/local/go/bin" ]; then
    export PATH="$PATH:/usr/local/go/bin"
    export PATH="$PATH:$HOME/go/bin"
    export GOPATH="$HOME/go"
fi

# Rust
if [ -d "$HOME/.cargo" ]; then
    [ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
fi

# bun
if [ -d "$HOME/.bun/bin" ]; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
    [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
fi

# direnv
if command -v direnv > /dev/null; then
    eval "$(direnv hook zsh)"
fi

# npm-global
if [ -d "$HOME/.npm-global" ]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi

# Ruby gems
if [ -d "$HOME/gems" ]; then
    export GEM_HOME="$HOME/gems"
    export GEM_PATH="$HOME/gems"
    export PATH="$HOME/gems/bin:$PATH"
fi

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

elif [[ $OSTYPE == darwin* ]]; then

    # brew PATH is handled by shellenv in .zshrc

    # Node Version Manager
    export NVM_DIR="${HOME}/.nvm"
    _nvm_sh="$(brew --prefix nvm 2>/dev/null)/nvm.sh"
    [ -s "$_nvm_sh" ] && source "$_nvm_sh"
    unset _nvm_sh

    # OpenJDK
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

    # Macports
    if [ -d "/opt/local/bin" ]; then
        export PATH="/opt/local/bin:$PATH"
    fi

fi

# micromamba shell integration (conda-compatible activate/deactivate)
if command -v micromamba &>/dev/null; then
    eval "$(micromamba shell hook --shell zsh)"
fi
