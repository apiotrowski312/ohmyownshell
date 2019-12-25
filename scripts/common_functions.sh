#!/bin/bash
declare -r RED_COLOR='\033[0;31m'
declare -r YELLOW_COLOR='\033[0;33m'
declare -r BLUE_COLOR='\033[0;34m'
declare -r NO_COLOR='\033[0m'

function info_log() {
    echo -e "[${BLUE_COLOR}INFO${NO_COLOR}] [$(date -R)] $1"
}

function error_log() {
    echo -e "[${RED_COLOR}ERROR${NO_COLOR}] [$(date -R)] $1"
}

function update_system() {
  apt-get update
  pkon update
}

function install_package() {
    apt-get install -y "$1" || (error_log "Troubles with package $1" && exit 1)
}

function install_packages() {
  for package in "$@"
  do
    install_package "${package}"
  done
}

function install_latest_release_from_github() {
  link=$(curl -L $1 | jq '.assets[].browser_download_url' | grep 'amd64.deb')

  wget -o /tmp/package.deb $link
  deb /tmp/package.deb
}

function install_github_apps() {
  for url in "$@"
  do
    install_latest_release_from_github "${url}"
  done
}