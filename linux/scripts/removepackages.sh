#!/usr/bin/env bash

ROOT=~/sacscyber/linux
SCRATCH=$ROOT/scratch

# Make a working directory only if it doesn't exist
mkdir -p $SCRATCH


while read package; do
  echo "Attempting to remove package:" $package
  apt-get remove $package -y
done < $ROOT/practices/removepackages.txt

apt autoremove -y
