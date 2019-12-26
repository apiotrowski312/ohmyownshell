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
  add_line_to_section fzf.sh
  end_section
}

function docker_no_sudo() {
  groupadd docker
  usermod -aG docker $SUDO_USER
}

function setup_all() {
  add_source_section
  docker_no_sudo
}