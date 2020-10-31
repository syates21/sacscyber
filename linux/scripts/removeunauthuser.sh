#!/usr/bin/env bash

ROOT=~/sacscyber/linux
SCRATCH=$ROOT/scratch

# Make a working directory only if it doesn't exist
mkdir -p $SCRATCH

# Get all the "regular" users (uid >= 1000), but not the "nobody" user and write them to a file
getent passwd|awk -F: '{if ($3 >= 1000 && $3 < 65534) { print $1 }}'| sort > $SCRATCH/startingusers.txt

# Combine admins and users into one sorted list
cat $ROOT/practice/adminusers.txt $ROOT/practice/authorizedusers.txt | uniq | sort > $SCRATCH/validusers.txt

# Just get the users that are in startingusers but not validusers
unauthusers=$(comm -23 $SCRATCH/startingusers.txt $SCRATCH/validusers.txt)

while read unauthuser; do
  echo "Removing unauthorized user:" $unauthuser 
  deluser $unauthuser
done <<<"$unauthusers"
