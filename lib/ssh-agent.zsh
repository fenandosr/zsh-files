# One shared ssh-agent for all shells (macOS + Linux), no extra dependencies.

# Where to store the cached environment for this user.
# Prefer XDG_RUNTIME_DIR on Linux; fallback to ~/.ssh on macOS/others.
_agent_dir="${XDG_RUNTIME_DIR:-$HOME/.ssh}"
[[ -d "$_agent_dir" ]] || mkdir -p "$_agent_dir" 2>/dev/null

ssh_env_cache="$_agent_dir/ssh-agent.env"

# Optional: list of keys to ensure are loaded (filenames or absolute paths).
# If empty, we will attempt default keys (id_ed25519, id_rsa, etc.) only if needed.
typeset -a SSH_AGENT_KEYS
SSH_AGENT_KEYS=(
  # "$HOME/.ssh/id_ed25519_work"
  # "$HOME/.ssh/id_ed25519_personal"
)

function _ssh_agent_socket_ok() {
  # Returns 0 if SSH_AUTH_SOCK points to a working agent.
  [[ -n "$SSH_AUTH_SOCK" && -S "$SSH_AUTH_SOCK" ]] || return 1
  ssh-add -l >/dev/null 2>&1 || return 1
  return 0
}

function _ssh_agent_load_env() {
  # Load cached env if present
  [[ -r "$ssh_env_cache" ]] || return 1
  source "$ssh_env_cache" >/dev/null 2>&1 || return 1
  _ssh_agent_socket_ok || return 1
  return 0
}

function _ssh_agent_start() {
  # Start a new agent and write env cache
  umask 077
  ssh-agent -s | sed '/^echo/d' >! "$ssh_env_cache"
  chmod 600 "$ssh_env_cache" 2>/dev/null
  source "$ssh_env_cache" >/dev/null 2>&1
  _ssh_agent_socket_ok || return 1
  return 0
}

function _ssh_agent_ensure() {
  # Try to load existing agent; else start a new one.
  if _ssh_agent_load_env; then
    return 0
  fi

  # If cache exists but is stale, remove it to avoid confusion
  [[ -e "$ssh_env_cache" ]] && rm -f "$ssh_env_cache" 2>/dev/null

  _ssh_agent_start
}

function _ssh_agent_add_keys() {
  local -a want_keys not_loaded
  local lines line sig file
  local -a loaded_sigs loaded_ids

  # Gather list of already-loaded keys
  if lines=$(ssh-add -l 2>/dev/null); then
    for line in ${(f)lines}; do
      loaded_sigs+=${${(z)line}[2]}
      loaded_ids+=${${(z)line}[3]}
    done
  fi

  # Decide which keys to try
  if (( ${#SSH_AGENT_KEYS} > 0 )); then
    want_keys=("${SSH_AGENT_KEYS[@]}")
  else
    # Defaults similar to ssh-add with no args
    for id in id_ed25519 id_rsa id_ecdsa id_dsa identity; do
      [[ -f "$HOME/.ssh/$id" ]] && want_keys+=("$HOME/.ssh/$id")
    done
  fi

  # Find which are not loaded yet
  for file in "${want_keys[@]}"; do
    [[ -f "$file" ]] || continue

    if [[ ${loaded_ids[(I)$file]} -le 0 ]]; then
      sig="$(ssh-keygen -lf "$file" 2>/dev/null | awk '{print $2}')"
      if [[ -n "$sig" && ${loaded_sigs[(I)$sig]} -le 0 ]]; then
        not_loaded+=("$file")
      fi
    fi
  done

  # Add only missing keys (this is where you'll be prompted once per agent lifetime)
  if (( ${#not_loaded} > 0 )); then
    ssh-add "${not_loaded[@]}"
  fi
}

# Main
_ssh_agent_ensure && _ssh_agent_add_keys

unset _agent_dir ssh_env_cache
unfunction _ssh_agent_socket_ok _ssh_agent_load_env _ssh_agent_start _ssh_agent_ensure _ssh_agent_add_keys

