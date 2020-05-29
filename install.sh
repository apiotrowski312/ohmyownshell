#!/bin/bash

source "$(dirname $(readlink -f $0))/scripts/install_apps.sh"
source "$(dirname $(readlink -f $0))/scripts/setup.sh"
source "$(dirname $(readlink -f $0))/scripts/logs.sh"

BASE_PACKAGES=(
  software-properties-common
  build-essential
  apt-transport-https
  ca-certificates
  curl
  gnupg-agent

  htop
  jq
  ncdu
  dos2unix
  shellcheck
  xclip
  tree
  imagemagick
  git

  yakuake
  filezilla
  kdenlive
  krita

  snapd
)

GITHUB_RELEASES=(
  https://api.github.com/repos/sharkdp/bat/releases/latest
  https://api.github.com/repos/sharkdp/fd/releases/latest

  https://api.github.com/repos/oguzhaninan/Stacer/releases/latest
  https://api.github.com/repos/Automattic/simplenote-electron/releases/latest
)

DEB_LINKS=(
  https://go.microsoft.com/fwlink/?LinkID=760868
)

SNAPS=(
  postman
)


TO_WORKAROUND_IN_FUTURE=(
  hadolint
  fdupes
  VMBox
  kdenlive
  go
)

AUTOSTART=(
  yakuake
)

function was_run_as_sudo() {
  if [[ -z "$SUDO_USER" ]]; then
    error_log "run script with sudo"

    exit 1
  fi
}

function main() {
  was_run_as_sudo

  ## install apps
  update_system
  install_packages "${BASE_PACKAGES[@]}"
  install_github_apps "${GITHUB_RELEASES[@]}"
  install_deb_apps "${DEB_LINKS[@]}"
  install_snaps "${SNAPS[@]}"

  ## workarounds
  install_fzf
  install_docker
  install_brave

  ## setup
  add_source_section
  docker_no_sudo
  docker_auto_completition

  add_app_to_autostart "${AUTOSTART[@]}"
}

main
