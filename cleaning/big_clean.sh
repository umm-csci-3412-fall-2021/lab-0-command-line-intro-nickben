#!/bin/bash
clean (){
	TempName=$(mktemp -d) #Stores the name of the temporary directory by piping to mktemp
	tar "$1" -z -x -f "$TempName" #unzips, extracts, and then specifies where
	cd "$TempName" || exit
	cleaned_name="cleaned_$1"
	grep -L -f=* -e="DELETE ME!" | xargs tar -c -f="$cleaned_name" #take everything that doesn't have the word, and tar it
	rm -rf "$TempName"
}	
