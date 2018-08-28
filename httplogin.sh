
#!/usr/bin/env bash

function addUserPass () {
   htpasswd -b /usr/bin/passwords/passwords $1 $2
   }
   function addUser () {
   if grep -q "$1" /etc/nagios/passwd
   then 
	   htpasswd -b /etc/nagios/passwd $1 $2
   fi

   typeset TMP_FILE=$( mktemp )
   touch "${TMP_FILE}"
   if cp -p /usr/bin/passwords/users "${TMP_FILE}"  
   then sed -e '/^groups:/ s/$/ '"$1"'/' "${TMP_FILE}" > /usr/bin/passwords/users
   fi
   exit
   }
   addUserPass $1 $2
   addUser $1 $2
