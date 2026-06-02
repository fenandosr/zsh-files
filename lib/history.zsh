## Command history configuration
if [[ -z "$HISTFILE" ]]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=100000
SAVEHIST=100000

setopt extended_history       # save timestamp and duration
setopt hist_expire_dups_first # expire duplicates first when trimming
setopt hist_ignore_dups       # don't record consecutive duplicates
setopt hist_ignore_space      # don't record commands starting with space
setopt hist_reduce_blanks     # trim superfluous blanks
setopt hist_verify            # show expanded history before running
setopt share_history          # share history across sessions (implies inc_append)
