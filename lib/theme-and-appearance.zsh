# ls colors
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
#export LS_COLORS

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  if [[ "$(uname -s)" == "NetBSD" ]]; then
    # On NetBSD, test if "gls" (GNU ls) is installed (this one supports colors); 
    # otherwise, leave ls as is, because NetBSD's ls doesn't support -G
    gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
  elif [[ "$(uname -s)" == "OpenBSD" ]]; then
    # On OpenBSD, test if "colorls" is installed (this one supports colors);
    # otherwise, leave ls as is, because OpenBSD's ls doesn't support -G
    colorls -G -d . &>/dev/null 2>&1 && alias ls='colorls -G'
  else
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
  fi
fi

setopt auto_cd
setopt multios
setopt cdablevars

if [[ x$WINDOW != x ]]
then
    SCREEN_NO="%B$WINDOW%b "
else
    SCREEN_NO=""
fi

# Apply theming defaults
PS1="%n@%m:%~%# "

_prompt_path() {
  local git_root
  git_root=$(git rev-parse --show-toplevel 2>/dev/null)
  if [[ -n "$git_root" ]]; then
    local path_str="${git_root:t}${PWD#$git_root}"
    if [[ -z $(git status --porcelain 2>/dev/null) ]]; then
      print -rn -- "%F{${_PROMPT_PATH_CLEAN_COLOR}}${path_str}%f"
    else
      print -rn -- "%F{${_PROMPT_PATH_DIRTY_COLOR}}${path_str}%f"
    fi
  else
    print -rn -- "%F{${_PROMPT_PATH_CLEAN_COLOR}}${PWD/#$HOME/~}%f"
  fi
}

theme-dark() {
  _CURRENT_THEME=dark
  _PROMPT_PATH_CLEAN_COLOR=white
  _PROMPT_PATH_DIRTY_COLOR=red
  PROMPT='%{$fg[green]%}[%{$fg[white]%}%n@%m%{$fg[green]%}] [$(_prompt_path)%{$fg[green]%}] >%{$reset_color%} '
  export LSCOLORS="Gxfxcxdxbxegedabagacad"
}

theme-light() {
  _CURRENT_THEME=light
  _PROMPT_PATH_CLEAN_COLOR=blue
  _PROMPT_PATH_DIRTY_COLOR=red
  PROMPT='%{$fg[blue]%}[%{$fg_bold[black]%}%n@%m%{$fg[blue]%}] [$(_prompt_path)%{$fg[blue]%}] >%{$reset_color%} '
  export LSCOLORS="ExFxBxDxCxegedabagacad"
}

theme-toggle() {
  [[ "$_CURRENT_THEME" == "dark" ]] && theme-light || theme-dark
}

# Default: dark theme
theme-dark

RPROMPT=''

# Setup the prompt with pretty colors
setopt prompt_subst

