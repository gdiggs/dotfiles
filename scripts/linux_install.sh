#!/bin/bash
set -e

if [ ! -z "$SKIP_SCRIPTS" ]; then
  exit 0
fi

if [ "$(uname)" != "Linux" ]; then
  echo "Not Linux - exiting."
  exit 0
fi

echo "== Installing packages"
sudo apt update
sudo apt install -y \
  ack \
  curl \
  git \
  gnupg \
  imagemagick \
  jq \
  shellcheck \
  sloccount \
  software-properties-common \
  tmux \
  tree \
  watch \
  wget \
  vim \
  xclip

snap install --classic heroku
snap install --classic hub

echo "== Installing rbnev"
sudo apt install -y \
  autoconf \
  bison \
  build-essential \
  libssl-dev \
  libyaml-dev \
  libreadline6-dev \
  zlib1g-dev \
  libncurses5-dev \
  libffi-dev \
  libgdbm-dev

if ! [ -d "$HOME/.rbenv" ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

echo "== Installing Keybase"
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install -y ./keybase_amd64.deb
run_keybase
rm ./keybase_amd64.deb

printf "Enter email to use for SSH: "
read email

if ! [ -f "$HOME/.ssh/id_rsa" ]; then
  echo "== Generating an SSH key"
  ssh-keygen -t rsa -b 4096 -C "$email"
  eval "$(ssh-agent -s)"
  ssh-add "$HOME/.ssh/id_rsa"

  echo "$HOME/.ssh/id_rsa.pub" | xclip -selection clipboard
  echo "Key copied to the clipboard. Add this key to GitHub: https://github.com/settings/keys"
fi
