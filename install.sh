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
)

GITHUB_RELEASES=(
  https://api.github.com/repos/sharkdp/bat/releases/latest
  https://api.github.com/repos/sharkdp/fd/releases/latest
  https://api.github.com/repos/adrianlopezroche/fdupes/releases/latest
)

DEB_LINKS=(
  https://go.microsoft.com/fwlink/?LinkID=760868
)


APPS=(
  # add Gestures (MACOS like)
  hadolint

  fzf

  go

  brave
  VMBox
  docker
)

# Check if you are root

update_system
install_packages "${BASE_PACKAGES[@]}"
install_github_apps "${GITHUB_RELEASES[@]}"
install_deb_apps "${DEB_LINKS[@]}"


# Stacer Kdenlive Simplenote