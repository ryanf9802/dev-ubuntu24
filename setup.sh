#!/usr/bin/env bash

# Setup for Ubuntu-24.04 WSL2 Development Environment
## This script should be run as the desired user profile. Changes to root will be made automatically

actual_user=${SUDO_USER:-$(id -un)}
actual_home=$(eval echo "~$actual_user")

sudo chown -R $actual_user:$actual_user $actual_home

sudo apt update

. /setup/src/apt_install.sh &&
. /setup/src/overwrite_config_files.sh &&
. /setup/src/install_neovim.sh &&
. /setup/src/auth_gh_cli.sh &&
. /setup/src/git_config.sh &&
. /setup/src/install_nvim_config.sh &&
. /setup/src/install_nodejs.sh &&
. /setup/src/install_python.sh &&
. /setup/src/install_docker.sh &&

sudo apt autoremove -y

sudo chown -R $actual_user:$actual_user $actual_home
