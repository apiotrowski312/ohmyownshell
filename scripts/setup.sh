#!/bin/bash

declare homedir
homedir=$(eval echo ~$SUDO_USER)

function remove_section() {
  sed -i '/## SCRIPT START/,/## SCRIPT END/d' $homedir/.bashrc
}

function start_section() {
  echo "## SCRIPT START" >> $homedir/.bashrc
}

function add_line_to_section() {
  echo source "$(dirname $(readlink -f $0))/dotfiles/$1" >> $homedir/.bashrc
}

function end_section() {
  echo "## SCRIPT END" >> $homedir/.bashrc
}

function add_source_section() {
  remove_section
  start_section

  add_line_to_section .variables
  add_line_to_section .aliases
  add_line_to_section .editor
  add_line_to_section fzf.sh
  add_line_to_section .ssh-agent

  end_section
}

function docker_no_sudo() {
  groupadd docker
  usermod -aG docker $SUDO_USER
}

function docker_auto_completition() {
  curl -L https://raw.githubusercontent.com/docker/compose/1.25.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compos
}

function add_app_to_autostart() {
  for app in "$@"; do
    cp /usr/share/applications/*${app}* ${homedir}/.config/autostart
    chmod 744 ${homedir}/.config/autostart/*${app}*
    chown $SUDO_USER:$SUDO_USER ${homedir}/.config/autostart/*${app}*
  done
}