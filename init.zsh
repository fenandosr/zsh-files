SOURCE=${0%/*}

# WSL detection (OSTYPE is linux-gnu on WSL, so this disambiguates)
[[ "$(uname -r)" == *microsoft* || -n "$WSL_DISTRO_NAME" ]] && IS_WSL=1

# Lib
for libfile in $SOURCE/lib/*.zsh; do
    source "$libfile"
done

# Init apps, define paths and envs
source $SOURCE/apps-paths.zsh

# Aliases
source $SOURCE/aliases.zsh

# Colors
source $SOURCE/colors.zsh

# Various functions
source $SOURCE/functions.zsh

