# Better grep results
# Note: GREP_OPTIONS was deprecated in GNU grep 2.21; use aliases instead.

export GREP_COLOR='1;32'

# Build options list for the alias
_grep_opts="--color=auto"

# avoid VCS folders (if the necessary grep flags are available)
grep-flag-available() {
    echo | grep $1 "" >/dev/null 2>&1
}
if grep-flag-available --exclude-dir=.cvs; then
    for PATTERN in .cvs .git .hg .svn; do
        _grep_opts+=" --exclude-dir=$PATTERN"
    done
elif grep-flag-available --exclude=.cvs; then
    for PATTERN in .cvs .git .hg .svn; do
        _grep_opts+=" --exclude=$PATTERN"
    done
fi
unfunction grep-flag-available

alias grep="grep $_grep_opts"
unset _grep_opts
