#!/usr/bin/env bash

KEYRING_DIR=/etc/apt/keyrings
KEY_FILE=$KEYRING_DIR/docker.gpg
if [ ! -f "$KEY_FILE" ]; then
  sudo mkdir -p "$KEYRING_DIR"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | sudo gpg --dearmor -o "$KEY_FILE"
fi

REPO_FILE=/etc/apt/sources.list.d/docker.list
ARCH_DEB="[arch=$(dpkg --print-architecture) signed-by=$KEY_FILE]"
REPO_LINE="deb $ARCH_DEB https://download.docker.com/linux/ubuntu lunar stable"
if ! grep -Fxq "$REPO_LINE" "$REPO_FILE" 2>/dev/null; then
  echo "$REPO_LINE" | sudo tee "$REPO_FILE" >/dev/null
fi

sudo apt-get update

packages=(
  docker-ce
  docker-ce-cli
  containerd.io
  docker-compose-plugin
  docker-buildx-plugin
)
to_install=()
for pkg in "${packages[@]}"; do
  if ! dpkg -s "$pkg" >/dev/null 2>&1; then
    to_install+=("$pkg")
  fi
done

if [ ${#to_install[@]} -gt 0 ]; then
  sudo apt-get install -y "${to_install[@]}"
else
  echo "All Docker packages are already installed, skipping."
fi
