#!/usr/bin/env bash

SCRIPTROOT=~/sacscyber

# Get all the "regular" users (uid >= 1000), but not the "nobody" user and write them to a file
getent passwd|awk -F: '{if ($3 >= 1000 && $3 < 65534) { print $1 }}'| sort > $SCRIPTROOT/training/startingusers.txt

# New password
newpw=$(<$SCRIPTROOT/training/securepw)
echo $newpw
