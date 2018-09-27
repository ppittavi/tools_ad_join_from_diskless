#!/bin/bash

if [ ! -d /var/lib/samba/printers  ]; then
	mmount /var/lib/samba
	mkdir /var/lib/samba/printers
fi
if [ ! -d /var/lib/samba/private  ]; then
	mkdir /var/lib/samba/private
fi
if [ ! -d /var/lib/samba/usershares  ]; then
	mkdir /var/lib/samba/usershares
	chmod o-r,g+w,+t /var/lib/samba/usershares
fi
if [ -f /host_specific_files/$HOSTNAME/krb5.keytab ]; then
	cp -f /host_specific_files/$HOSTNAME/krb5.keytab /tmp/
fi

exit 0
