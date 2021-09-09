#!/bin/bash

StartLoc="$(pwd)" #stores where we started at
TempName=$(mktemp -d) #Stores the name of the temporary directory by piping to mktemp
tar -zxf "$1" -C "$TempName" #unzips, extracts, and then specifies where
cleaned_name="cleaned_$1"
grep -lr "DELETE ME!" "$TempName" | xargs rm #Delete every file which contains the phrase "DELETE ME!"
tar -C "$TempName" -zhcf "$StartLoc/$cleaned_name" "$(basename "$1" .tgz)" #From the temp location, since we know what the inner folder will be,
#and we know we've cleaned out everything that needs to be deleted, we simply archive the folder and everything left in it.
cd "$StartLoc" || exit #go back to where we started, for simplicity
rm -r "$TempName"
