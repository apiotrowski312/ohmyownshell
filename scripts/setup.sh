#!/bin/bash

declare homedir
homedir=$(eval echo ~$SUDO_USER)

function remove_section() {
  sed -i '/## SCRIPT START/,/## SCRIPT END/d' $homedir/.bashrc
}

function add_source() {
  echo source "$(dirname $(readlink -f $0))/../.variables" >> $homedir/.bashrc
  echo source "$(dirname $(readlink -f $0))/../.aliases" >> $homedir/.bashrc
}

function docker_no_sudo() {
  groupadd docker
  usermod -aG docker $SUDO_USER
}

function setup_all() {
  remove_section
  echo "## SCRIPT START" >> $homedir/.bashrc
  add_source
  echo "## SCRIPT END" >> $homedir/.bashrc
  docker_no_sudo
}