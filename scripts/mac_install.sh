#!/usr/bin/env bash
set -e

pause() {
  read -p "Press any key to continue... " -n 1 -s
}

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
  gnupg \
  gpg-agent \
  heroku \
  hub \
  imagemagick \
  jq \
  openssl \
  pinentry-mac \
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

echo "== Generating an SSH key"
ssh-keygen -t rsa -b 4096 -C "gordon@gordondiggs.com"
eval "$(ssh-agent -s)"
ssh-add -K "$HOME/.ssh/id_rsa"

cat "$HOME/.ssh/id_rsa.pub" | pbcopy
echo "Key copied to the clipboard. Add this key to GitHub: https://github.com/settings/keys"

pause

echo "== Setting up GPG"
gpg --gen-key
gpg --armor --export "gordon@gordondiggs.com" | pbcopy
echo "Key copied to the clipboard. Add this key to Github: https://github.com/settings/keys"

pause

id=$(gpg --list-keys | sed "4q;d" | awk '{$1=$1}1')
git config --global user.signingKey "$id"
git config --global commit.gpgsign true
