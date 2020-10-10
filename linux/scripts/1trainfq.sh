#!/usr/bin/env bash

ANSWERFILE=~/Desktop/Forensics\ Question\ 1.txt
ANSWERTEXT="<Type Answer Here>"

# Look in home for mp3 files and grab just the path
mp3dir=$(find /home -name \*.mp3|sed 's|/[^/]*$||'|uniq)
echo "Found mp3 file(s) in:" $mp3dir

# Using @ as the delimiter for sed expression becaue the path contains / chars
sed -i "s@$ANSWERTEXT@$mp3dir@" "$ANSWERFILE"
