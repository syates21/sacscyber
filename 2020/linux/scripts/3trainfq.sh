#!/usr/bin/env bash

ANSWERFILE=~/Desktop/Forensics\ Question\ 3.txt
ANSWERTEXT="<Type Answer Here>"
TEMPFILE=~/Desktop/fq3temp.txt

# Get the group members for injustice
members=$(getent group injustice|cut -f4 -d:|tr ',' '\n')


# Find out the number of answer rows
numanswers=$(echo $members | wc -w)

# Trim the last lines off the ANSWERFILE
head -n -$numanswers "$ANSWERFILE" > $TEMPFILE


# Write out an answer entry for each row to the temp file
for member in $members; do
  echo "Adding entry to answer file:" $member
  echo ANSWER: $member >> $TEMPFILE
done


# Move the temp file over the original answer file
mv $TEMPFILE "$ANSWERFILE"
