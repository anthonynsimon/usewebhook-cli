#!/bin/bash

set -e

# Detect OS
os_out=`uname -s`
case $os_out in
  Darwin*)  os="darwin"; dest=/usr/local/bin/ ;;
  Linux*)   os="linux"; dest=/usr/bin/ ;;
  *)        echo "unsupported OS ${os_out}, please build from source" && exit 1 ;;
esac

# Detect architecture
arch_out=`uname -m`
case $arch_out in
  amd64*)   architecture="amd64" ;;
  x86_64*)  architecture="amd64" ;;
  arm64*)   architecture="arm64" ;;
  aarch64*) architecture="arm64" ;;
  *)        echo "unsupported architecture ${arch_out}, please build from source" && exit 1 ;;
esac

# Prepare platform specific vars
platform="${os}_${architecture}"
release_filename="usewebhook_${platform}.tar.gz"
download_url="https://github.com/anthonynsimon/usewebhook-cli/releases/latest/download/${release_filename}"

echo "Detected platform: $platform, installing latest release..."

curl -sOL $download_url
sudo tar xf $release_filename -C $dest
rm $release_filename

echo "UseWebhook CLI has been installed successfully!"
echo ""
usewebhook --help
