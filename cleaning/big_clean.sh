#!/bin/bash

StartLoc="$(realpath "$1")" #stores where we started at
TempName=$(mktemp -d) #Stores the name of the temporary directory by piping to mktemp
tar -C "$TempName" -zxf "$StartLoc" #unzips, extracts, and then specifies where
#cd "$TempName" || exit
cleaned_name="cleaned_$1"
grep -Lr "DELETE ME!" "$TempName" | xargs tar -cf "$cleaned_name"

#grep -Le="DELETE ME!" | xargs tar -c -f="$cleaned_name" #take everything that doesn't have the word, and tar it
#grep -le "DELETE ME!" | xargs rm
#cd "$StartLoc"
#tar -czf "$cleaned_name" *


rm -r "$TempName"
