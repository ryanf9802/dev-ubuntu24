#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y

PACKAGES=(
  git
  gh
  ripgrep
  ca-certificates
  fzf
  xclip
  unzip
  build-essential
  libssl-dev
  zlib1g-dev
  libncursesw5-dev 
  libbz2-dev 
  libreadline-dev
  libsqlite3-dev 
  libffi-dev 
  liblzma-dev 
  wget
)

sudo apt install -y "${PACKAGES[@]}"
