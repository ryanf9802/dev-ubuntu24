#!/usr/bin/env bash

actual_user=${SUDO_USER:-$(id -un)}
actual_home=$(eval echo "~$actual_user")

if ! sudo -u "$actual_user" gh auth status &>/dev/null; then
  sudo -u "$actual_user" gh auth login
else
  echo "GitHub CLI already authenticated for $actual_user"
fi

sudo chown -R $actual_user:$actual_user $actual_home

gh auth setup-git
gh config set editor nvim
