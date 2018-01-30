#!/usr/bin/env bash
set -e

if ! [ -x "$(command -v brew)" ]; then
  echo "== Installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "== Installing homebrew packages"
brew install \
  ack \
  awscli \
  coreutils \
  git \
  heroku \
  hub \
  imagemagick \
  jq \
  openssl \
  sloccount \
  tree \
  watch \
  wget

echo "== Installing homebrew cask packages"
brew cask install \
  --require-sha \
  1password \
  beardedspice \
  bettertouchtool \
  captin \
  dropbox \
  google-chrome \
  istat-menus \
  licecap \
  macdown \
  macvim \
  paw \
  spotify \
  spotify-notifications \
  soulver
