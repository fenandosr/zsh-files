#!/usr/bin/env zsh

PROMPT='%{$fg[green]%}[%{$fg[white]%}%n%{$fg[green]%}] [%{$fg[white]%}%~%{$fg[green]%}] >%{$reset_color%} '
RPROMPT='%{$fg[green]%}[%{$fg[white]%}$(git_prompt_info)%{$fg[green]%}]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
