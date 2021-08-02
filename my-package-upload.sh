#!/bin/bash

DE_WM=${DESKTOP_SESSION:-"default"}

# Detect distribution. Seprate the list files in different folder depending on the distribution.
# https://stackoverflow.com/questions/29581754/how-to-find-linux-distribution-name-using-shell-script
DISTRO="$(awk -F'=' '/^ID=/ {print tolower($2)}' /etc/*-release)"
if [[ "${DISTRO}" == "" ]]; then
  echo "No distribution found."
  exit 1
fi

mkdir -p .MY-PACKAGE-LIST/"${DISTRO}"/"${DE_WM}"
cd .MY-PACKAGE-LIST/"${DISTRO}"/"${DE_WM}"

sh ../../my-package-upload-specific.sh

# -----------------------------------------------------------------

/usr/bin/pip3 list | awk '{print $1}' >my-pip-list.txt
/usr/bin/pip3 freeze >my-pip-freeze.txt
sudo /usr/bin/npm list -g --depth=0 >my-npm-list.txt
docker images | awk '{print $1}' >my-docker-list.txt
brew list >my-brew-list.txt
# cargo install --list
ls ~/.cargo/bin >my-cargo-list.txt
ls ~/go/bin >my-go-list.txt


# ===
# === Conda
# ===
if [[ -e /opt/"${MYCONDA}" ]]; then
  mkdir -p conda
  # Base
  /opt/"${MYCONDA}"/bin/pip3 list >conda/base 2>/dev/null
  # Others
  CONDA_ENV_HOME=~/.conda/envs
  for item in $(ls "${CONDA_ENV_HOME}"); do
    "${CONDA_ENV_HOME}"/"${item}"/bin/pip3 list >conda/"${item}" 2>/dev/null
  done
fi

