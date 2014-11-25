#!/usr/bin/env bash

/* README Must change the directory paths to your own.
  This is a bash script to add or update a user to a user group and a password to a password file. 
  You can use this script with other serverside scripts to change Apache authentication for example.
  This script uses htpasswd for hashing and takes two arguments 1. Username 2. Password. Example:
  adduser.sh iamuser password */
  
function addUserPass () {
   htpasswd -b /path/to/passwords $1 $2
}
function addUser () {
if grep -q "$1" /path/to/passwd
then
htpasswd -b /path/to/passwd $1 $2
fi

typeset TMP_FILE=$( mktemp )
touch "${TMP_FILE}"
if cp -p /path/to/users "${TMP_FILE}"
then sed -e '/^employees:/ s/$/ '"$1"'/' "${TMP_FILE}" > /path/to/users
fi
exit
}
addUserPass $1 $2
addUser $1 $2
