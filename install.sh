#!/bin/bash

source ./scripts/common_functions.sh

BASE_PACKAGES=(
  software-properties-common
  build-essential

  htop
  jq
  dos2unix
  shellcheck

  yakuake

  snapd
)

GITHUB_RELEASES=(
  https://api.github.com/repos/sharkdp/bat/releases/latest
  https://api.github.com/repos/sharkdp/fd/releases/latest
)

DEB_LINKS=(
  https://go.microsoft.com/fwlink/?LinkID=760868
)

SNAPS=(
  go --clasic
  brave
  docker
  postman
)

APPS=(
  # add Gestures (MACOS like)
  hadolint
  fzf
  fdupes
  VMBox
)

# Check if you are root

update_system
install_packages "${BASE_PACKAGES[@]}"
install_github_apps "${GITHUB_RELEASES[@]}"
install_deb_apps "${DEB_LINKS[@]}"
install_snaps "${SNAPS[@]}"


# Stacer Kdenlive Simplenote