#!/bin/bash

set -e

# Detect OS
os_out=`uname -s`
case $os_out in
  Darwin*)  os="darwin"; dest=/usr/local/bin/ ;;
  Linux*)   os="linux"; dest=/usr/bin/ ;;
  FreeBSD*) os="freebsd"; dest=/usr/local/bin/ ;;
  *)        echo "unsupported OS ${os_out}" && exit 1 ;;
esac

# Detect architecture
arch_out=`uname -m`
case $arch_out in
  amd64*)   architecture="amd64" ;;
  x86_64*)  architecture="amd64" ;;
  arm64*)   architecture="arm64" ;;
  aarch64*) architecture="arm64" ;;
  arm*)     architecture="arm" ;;
  *)        echo "unsupported architecture ${arch_out}" && exit 1 ;;
esac

# Prepare platform specific vars
platform="${os}_${architecture}"
release_filename="usewebhook_${platform}.tar.gz"
download_url="https://github.com/anthonynsimon/usewebhook-cli/releases/latest/download/${release_filename}"

echo "Detected platform $platform and arch $architecture"
echo "Installing latest release..."

curl -sOL $download_url
sudo tar xvf $release_filename -C $dest

echo "UseWebhook CLI has been installed successfully!"
usewebhook --help
