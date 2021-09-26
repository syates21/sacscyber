#!/usr/bin/env bash

ANSWERFILE=~/Desktop/Forensics\ Question\ 2.txt
ANSWERTEXT="<Type Answer Here>"

# Get the user savitar's id
userid=$(id -u savitar)

echo "Found id for savitar:" $userid

# Using @ as the delimiter for sed expression becaue the path contains / chars
sed -i "s/$ANSWERTEXT/$userid/" "$ANSWERFILE"
