#!/bin/bash

function update_system() {
  apt-get update
  pkon update
}

function install_package() {
    apt-get install -y "$1" || error_log "Troubles with package $1"
}

function install_packages() {
  for package in "$@"
  do
    install_package "${package}"
  done
}

function prepare_link_from_github() {
  l=($(curl -L "$1" | jq -r '.assets[].browser_download_url' | grep 'amd64.deb'))

  echo "${l[0]}"
}

function install_deb_file() {
    echo $1
    curl -o /tmp/package.deb -L "$1" || error_log "Something went wrong with curl $1"
    apt install -y /tmp/package.deb || error_log "Troubles with installing deb package $1"
}

function install_github_apps() {
  for url in "$@"
  do
    link="$(prepare_link_from_github "${url}")"
    install_deb_file "$link"
  done
}

function install_deb_apps() {
  for url in "$@"
  do
    install_deb_file "$url"
  done
}

function install_snaps() {
  for app in "$@"
  do
    snap install "$app" || error_log "Troubles with snap $app"
  done
}

function install_snaps_classic() {
  for app in "$@"
  do
    snap install "$app" --classic || error_log "Troubles with snap --classic $app"
  done
}

function install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git $(eval echo ~$SUDO_USER)/.fzf
  $(eval echo ~$SUDO_USER)/.fzf/install
}