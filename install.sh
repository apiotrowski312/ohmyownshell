#!/bin/bash

PACKAGES=(
  software-properties-common

  bat
  htop
  jq

  hadolint
  shellcheck

  vs-code
  brave
  Oracle VM Box

  go
  python3-7

  # Other
  dos2unix
)

update_system () {
  apt-get update
  pkon update
}

install_packages () {
  for package in "${PACKAGES[@]}"
  do
    apt-get install -y "${package}"
  done
}


update_system
install_packages