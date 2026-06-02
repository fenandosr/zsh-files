## smart urls — bracketed-paste-magic replaces the deprecated url-quote-magic
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER="less"
export LESS="-R"

[[ -n "$LANG" ]] && export LC_CTYPE=$LANG
