#!/bin/bash

source "$(dirname $(readlink -f $0))/scripts/install_apps.sh"
source "$(dirname $(readlink -f $0))/scripts/setup.sh"
source "$(dirname $(readlink -f $0))/scripts/logs.sh"

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
  brave
  docker
  postman
)

SNAPS_CLASSIC=(
  go
)

APPS=(
  # add Gestures (MACOS like)
  hadolint
  fzf
  fdupes
  VMBox
)

function was_run_as_sudo() {
  if [[ -z "$SUDO_USER" ]]; then
    error_log "run script with sudo"

    exit 1
  fi
}

# Check if you are root
function main() {
  was_run_as_sudo

  update_system
  install_packages "${BASE_PACKAGES[@]}"
  install_github_apps "${GITHUB_RELEASES[@]}"
  install_deb_apps "${DEB_LINKS[@]}"
  install_snaps "${SNAPS[@]}"
  install_snaps_classic "${SNAPS_CLASSIC[@]}"

  setup_all
}

main

# Stacer Kdenlive Simplenote