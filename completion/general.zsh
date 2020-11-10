# General completion patterns

autoload -Uz compinit
compinit

# teamocil
compctl -g '~/.teamocil/*(:t:r)' teamocil

# compdef toggl
_toggl() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _TOGGL_COMPLETE=complete-zsh  toggl)
}
if [[ "$(basename -- ${(%):-%x})" != "_toggl" ]]; then
  compdef _toggl toggl
fi

