#!/usr/bin/env bash

confirm_change() {
  local prompt="$1"
  read -r -p "$prompt [y/N]: " response
  case "$response" in
    [yY][eE][sS]|[yY]) return 0 ;;
    *) return 1 ;;
  esac
}

current_name=$(git config --global user.name || echo "")
if [[ -n "$current_name" ]]; then
  if confirm_change "Current Git user.name is '$current_name'. Change it?"; then
    read -rp "Enter new Git user.name: " git_name
    git config --global user.name "$git_name"
  fi
else
  read -rp "Enter your Git user.name: " git_name
  git config --global user.name "$git_name"
fi

current_email=$(git config --global user.email || echo "")
if [[ -n "$current_email" ]]; then
  if confirm_change "Current Git user.email is '$current_email'. Change it?"; then
    read -rp "Enter new Git user.email: " git_email
    git config --global user.email "$git_email"
  fi
else
  read -rp "Enter your Git user.email: " git_email
  git config --global user.email "$git_email"
fi

git config --global push.autoSetupRemote true
git config --global core.editor nvim
