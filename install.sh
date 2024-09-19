#!/bin/bash

set -e

# Detect the operating system and architecture
OS=$(uname -s)
ARCH=$(uname -m)
RELEASE_URL="https://github.com/anthonynsimon/usewebhook-cli/releases/latest/download"

# Download the latest release
if [ "$OS" == "Linux" ]; then
    if [ "$ARCH" == "x86_64" ]; then
        curl -sSL $RELEASE_URL/usewebhook_linux_x64.tar.gz -o usewebhook.tar.gz
        tar -xzf usewebhook.tar.gz
        mv usewebhook /usr/local/bin/
        rm usewebhook.tar.gz
    elif [ "$ARCH" == "i686" ]; then
        curl -sSL $RELEASE_URL/usewebhook_linux_x86.tar.gz -o usewebhook.tar.gz
        tar -xzf usewebhook.tar.gz
        mv usewebhook /usr/local/bin/
        rm usewebhook.tar.gz
    else
        echo "Unsupported architecture: $ARCH" >&2
        exit 1
    fi
elif [ "$OS" == "Darwin" ]; then
    curl -sSL $RELEASE_URL/usewebhook_mac.tar.gz -o usewebhook.tar.gz
    tar -xzf usewebhook.tar.gz
    mv usewebhook /usr/local/bin/
    rm usewebhook.tar.gz
else
    echo "Unsupported operating system: $OS" >&2
    exit 1
fi

chmod +x /usr/local/bin/usewebhook
echo "UseWebhook CLI has been installed successfully."
