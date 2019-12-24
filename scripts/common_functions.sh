#!/bin/bash

function update_system() {
  apt-get update
  pkon update
}

function install_package() {
    apt-get install -y "$1"
}

function install_packages() {
  for package in "$@"
  do
    install_package "${package}"
  done
}
