SOURCE=${0%/*}

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

# Completion
source $SOURCE/completions.zsh

# Various functions
source $SOURCE/functions.zsh

