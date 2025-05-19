#!/usr/bin/env bash

BUILD_PYTHON=false

LATEST=$(sudo curl -s https://www.python.org/ftp/python/ \
         | grep -Eo '3\.13\.[0-9]+' \
         | sort -V \
         | tail -1)

MAJORMINOR=${LATEST%.*}

if command -v python${MAJORMINOR} &>/dev/null; then
  INSTALLED=$(python${MAJORMINOR} --version 2>&1 | awk '{print $2}')
  if [[ "$INSTALLED" == "$LATEST" ]]; then
    echo "Python $LATEST already installed — skipping build."
  else
    echo "→ Found python${MAJORMINOR}@${INSTALLED}, but latest is $LATEST. Rebuilding…"
    BUILD_PYTHON=true
  fi
else
  echo "→ python${MAJORMINOR} not found. Building Python $LATEST…"
  BUILD_PYTHON=true
fi

if [[ "${BUILD_PYTHON:-false}" == "true" ]]; then
  cd /usr/src
  sudo wget https://www.python.org/ftp/python/${LATEST}/Python-${LATEST}.tgz
  sudo tar xzf Python-${LATEST}.tgz
  cd Python-${LATEST}
  sudo ./configure --enable-optimizations --with-ensurepip=install
  sudo make -j"$(nproc)"
  sudo make altinstall
  cd /usr/src
  sudo rm -f Python-${LATEST}.tgz
  echo "Installed Python $LATEST"
  cd ~
fi

sudo apt install -y python3-pip python3-venv pipx
pipx install black ruff
