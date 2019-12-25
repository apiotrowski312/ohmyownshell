#!/bin/bash

source ./scripts/common_functions.sh

BASE_PACKAGES=(
  software-properties-common
  build-essential

  htop
  jq
  dos2unix
)

DEB_PACKAGES=(
  https://api.github.com/repos/sharkdp/bat/releases/latest
)

APPS=(
  # add Gestures (MACOS like)

  hadolint
  shellcheck
  nodejs

  go

  fd
  fduped
  fzf
  bat

  vscode
  yakuake
  brave
  VMBox
  docker

)

# Check if you are root

update_system
install_packages "${BASE_PACKAGES[@]}"
install_github_apps "${DEB_PACKAGES[@]}"


# Stacer Kdenlive Simplenote