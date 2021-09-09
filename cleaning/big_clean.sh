#!/bin/bash

StartLoc="$(pwd)" #stores where we started at
TempName=$(mktemp -d) #Stores the name of the temporary directory by piping to mktemp
tar -zxf "$1" -C "$TempName" #unzips, extracts, and then specifies where
#cd "$TempName" || exit
cleaned_name="cleaned_$1"
#grep -Lr "DELETE ME!" | xargs basename -a | xargs tar -zhcf "$StartLoc/$cleaned_name" #Find everything not flagged to be deleted, and archive it
grep -lr "DELETE ME!" "$TempName" | xargs rm
tar -C "$TempName" -zhcf "$StartLoc/$cleaned_name" "$(basename "$1" .tgz)"

#mv "$StartLoc" "$cleaned_name" #Move the archive back to where it belongs
cd "$StartLoc" || exit #go back to where we started, for simplicity

#grep -Le="DELETE ME!" | xargs tar -c -f="$cleaned_name" #take everything that doesn't have the word, and tar it
#grep -le "DELETE ME!" | xargs rm
#cd "$StartLoc"
#tar -czf "$cleaned_name" *


rm -r "$TempName"
