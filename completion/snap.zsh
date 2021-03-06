# file snappy.zsh
# contains an autocomplete function for snap in zsh

compdef _snap snap

_snap() {
  if (( CURRENT == 2 )); then
    _values\
      "abort[Abort a pending change]"\
      "ack[Adds an assertion to the system]"\
      "alias[Enables the given aliases]"\
      "aliases[Lists aliases in the system]"\
      "buy[Buys a snap]"\
      "change[List a change's tasks]"\
      "changes[List system changes]"\
      "connect[Connects a plug to a slot]"\
      "disable[Disables a snap in the system]"\
      "disconnect[Disconnects a plug from a slot]"\
      "download[Downloads the given snap]"\
      "enable[Enables a snap in the system]"\
      "find[Finds packages to install]"\
      "get[Prints configuration options]"\
      "help[Help]"\
      "info[show detailed information about a snap]"\
      "install[Installs a snap to the system]"\
      "interfaces[Lists interfaces in the system]"\
      "known[Shows known assertions of the provided type]"\
      "list[List installed snaps]"\
      "login[Authenticates on snapd and the store]"\
      "logout[Log out of the store]"\
      "refresh[Refreshes a snap in the system]"\
      "remove[Removes a snap from the system]"\
      "revert[Reverts the given snap to the previous state]"\
      "run[Run the given snap command]"\
      "set[Changes configuration options]"\
      "try[Tests a snap in the system]"\
      "unalias[Disables the given aliases]"\
      "version[help]"\
      "watch[Watch a change in progress]"
  elif (( CURRENT == 3)); then
    _files -g \*.snap
  fi
}

# file snappy.zsh
