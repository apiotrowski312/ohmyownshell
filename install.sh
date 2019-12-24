#!/bin/bash

source ./scripts/common_functions.sh

BASE_PACKAGES=(
  software-properties-common
  build-essential

  fd
  fduped
  fzf

  bat
  htop
  jq
  dos2unix
)

APPS=(
  # add Gestures (MACOS like)

  hadolint
  shellcheck
  nodejs

  go

  vscode
  yakuake
  brave
  VMBox
  docker

)

# Check if you are root

update_system
install_packages "${BASE_PACKAGES[@]}"



# Stacer Kdenlive Simplenote