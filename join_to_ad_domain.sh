#!/bin/bash

if [ -f /host_specific_files/$HOSTNAME/krb5.keytab ]
then
	rm -f /host_specific_files/$HOSTNAME/krb5.keytab
 	net ads leave -k 2> /dev/null
fi



kinit a_ppittavi@ATENEO.UNITO.IT
KRB5_KTNAME=FILE:/tmp/krb5.keytab net ads join  "createcomputer=OU=Dipartimento di Fisica,OU=Workstations,OU=Polo_Scienze_della_Natura,OU=Unito_Computers,DC=ateneo,DC=unito,DC=it" -k

sleep 1

if [ ! -f /tmp/krb5.keytab ]
then
	echo "Error!"
	exit
fi
if [ ! -d /host_specific_files/$HOSTNAME/ ]
then
	mkdir /host_specific_files/$HOSTNAME/
fi
cp -f /tmp/krb5.keytab /host_specific_files/$HOSTNAME/
systemctl restart sssd
