#!bin/bash

#The URLS associated with this script have numbers within a specific number.
#As URLs accept specific variables, we'll give the user the option to enter the numeric value in two ways and account for the deficiency in the incorrect format with REGEX.

#prompt user to enter the snapshot branch number (will accept 1 or 01 formatting)
#sbn = snapshotbranch number
read -p 'Enter your snapshot branch number (1-6 or 01-06): ' sbn

#validate input: number must be in the form 1-6 or 01-06 using Regex
if [[ ! "$sbn" =~ ^[1-6]$ && ! "$sbn" =~ ^0[1-6]$ ]]; then
	echo "Invalid input. Please enter a number between 1 and 6, or 01 and 06"
	exit 1
fi

#Normalize numbers not entered as "01-06" into the accepted format
if [[ ! "$sbn" =~ ^0[1-6]$ ]]; then
	sbn=$(printf "%02d" "sbn")
fi

#Create variables to append the numbers to the url
url_base1="some url authority"
url_path1="some url path"
url_base2="some url authority"
url_path2="some url path"
url_base3="some url authority"
url_path3="some url path"

full_url1="${url_base1}/${sbn}/${url_path1}"
full_url2="${url_base2}/${sbn}/${url_path2}"
full_url3="${url_base3}/${sbn}/${url_path3}"

open "$full_url1" &&
open "$full_url2" &&
open "$full_url3"
