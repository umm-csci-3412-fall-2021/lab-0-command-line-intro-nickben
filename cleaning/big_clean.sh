#!/bin/bash

StartLoc="$(realpath "$1")"/".." #stores where we started at
TempName=$(mktemp -d) #Stores the name of the temporary directory by piping to mktemp
tar -zxf "$1" "$TempName"  #unzips, extracts, and then specifies where
cd "$TempName" || exit
cleaned_name="cleaned_$1"
#grep -Le="DELETE ME!" | xargs tar -c -f="$cleaned_name" #take everything that doesn't have the word, and tar it
grep -le "DELETE ME!" | xargs rm
cd "$StartLoc"
tar -czf "$cleaned_name" *
rm -r "$TempName"
