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
    apt install -y --allow-downgrades /tmp/package.deb || error_log "Troubles with installing deb package $1"
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
  yes | $(eval echo ~$SUDO_USER)/.fzf/install
}

function install_docker() {
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  apt-key fingerprint 0EBFCD88
  add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
  apt-get update
  apt-get install -y docker-ce docker-ce-cli containerd.io

  curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

function install_brave() {
  curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
  echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  apt update
  apt install -y brave-browser
}

function install_go() {
  curl https://golang.org/dl/go1.15.2.linux-amd64.tar.gz -o /tmp/go-installer.tar.gz
  tar -C /usr/local -xzf /tmp/go-installer.tar.gz
} 

# vim: ts=2 sts=2 sw=2 
