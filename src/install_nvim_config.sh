#!/usr/bin/env bash

if [ -d ~/.config/nvim ]; then
  sudo rm -rf ~/.config/nvim
fi
if [ -d /root/config/nvim ]; then
  sudo rm -rf /root/config/nvim
fi
gh repo clone ryanf9802/NeoVim-Configuration ~/.config/nvim
sudo mkdir -p /root/.config
sudo cp -raf ~/.config/nvim /root/.config/nvim
