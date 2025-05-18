#!/usr/bin/env bash

# Overwrite configuration files
sudo cp -rfa /setup/home/. $HOME
sudo cp -rfa /setup/home/. /root/

source ~/.bashrc
