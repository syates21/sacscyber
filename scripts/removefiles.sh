#!/usr/bin/env bash

# Get rid of MP3 files from /home directories
echo "Removing any .mp3 files from /home"
find /home -name \*.mp3 -type f -delete -print
