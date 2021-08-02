#!/bin/bash
sudo apt-get install --assume-yes fontconfig
sudo mkdir -p /usr/share/fonts/windows
sudo cp -r /mnt/c/Windows/Fonts/*.ttf /usr/share/fonts/windows/
fc-cache
sudo locale-gen zh_CN.UTF-8

