#!/bin/bash

function add_variables() {
  # echo source $(PWD)/../.variables >> ~/.bashrc
  echo $PWD
}

function add_aliases() {
  echo source $(PWD)/../.aliases >> ~/.bashrc
}

function docker_no_sudo() {
  groupadd docker
  usermod -aG docker $USER
}

function setup_all() {
  add_variables
  add_aliases
  docker_no_sudo
}