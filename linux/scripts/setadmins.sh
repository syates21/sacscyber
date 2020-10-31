#!/usr/bin/env bash

ROOT=~/sacscyber/linux
SCRATCH=$ROOT/scratch

# Make a working directory only if it doesn't exist
mkdir -p $SCRATCH

# Get all the sudo users
getent group sudo|cut -f4 -d:|tr ',' '\n'|sort > $SCRATCH/startadminusers.txt

# Sort valid admin users
cat $ROOT/practice/adminusers.txt | sort > $SCRATCH/sortedadminusers.txt

# Get users that should be admins (sortedadminusers) but aren't already (startadminusers.txt)
adminstoadd=$(comm -13 $SCRATCH/startadminusers.txt $SCRATCH/sortedadminusers.txt)

# Get users that are already admins (startadminusers.txt) but shouldn't be (startadminusers.txt)
adminstoremove=$(comm -23 $SCRATCH/startadminusers.txt $SCRATCH/sortedadminusers.txt)

for admin in $adminstoadd; do
  gpasswd -a $admin sudo
done

for admin in $adminstoremove; do
  gpasswd -d $admin sudo
done
