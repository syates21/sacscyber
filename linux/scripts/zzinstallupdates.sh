#!/usr/bin/env bash

# First look for new package updates
echo "Checking for updated packages"
apt-get update -y

# Do any upgrades available
echo "Installing updates"
apt-get upgrade -y
