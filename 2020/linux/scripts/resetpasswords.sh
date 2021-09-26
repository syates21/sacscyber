#!/usr/bin/env bash

ROOT=~/sacscyber/linux
SCRATCH=$ROOT/scratch
DONTCHANGEUSER=ballen

# Make a working directory only if it doesn't exist
mkdir -p $SCRATCH

# Get all the "regular" users (uid >= 1000), but not the "nobody" user and write them to a file
getent passwd|awk -F: '{if ($3 >= 1000 && $3 < 65534) { print $1 }}'| sort > $SCRATCH/startingusers.txt

# Combine admins and users into one sorted list
cat $ROOT/training/adminusers.txt $ROOT/training/authorizedusers.txt | uniq | sort > $SCRATCH/validusers.txt

# Get new password to use
newpw=$(cat $ROOT/training/securepw)
echo $newpw

# Reset password for everyone but ballen
while read user; do
  if [ $user = $DONTCHANGEUSER ]
  then
    echo "Skipping password reset for:" $user 
  else
    echo "Resetting password for:" $user
    echo -e "$newpw\n$newpw" | passwd $user
  fi
done < $SCRATCH/validusers.txt
