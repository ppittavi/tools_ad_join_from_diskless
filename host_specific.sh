#!/bin/bash
systemctl restart smbd
if [ ! -d /var/lib/sss/db  ]; then
	mount /var/lib/sss/
	mkdir /var/lib/sss/db
fi
if [ ! -d /var/lib/sss/keytabs  ]; then
	mkdir /var/lib/sss/keytabs
fi
if [ ! -d /var/lib/sss/mc  ]; then
	mkdir /var/lib/sss/mc
fi
if [ ! -d /var/lib/sss/pubconf  ]; then
	mkdir /var/lib/sss/pubconf
fi
if [ ! -d /var/lib/sss/gpo_cache  ]; then
	mkdir /var/lib/sss/gpo_cache
fi
if [ ! -d /var/lib/sss/pipes/private ]; then
	mkdir -p  /var/lib/sss/pipes/private
fi

if [ -f /var/run/sssd.pid ]; then
	rm -f /var/run/sssd.pid
fi
if [ ! -d /var/lib/sss/pubconf/krb5.include.d/  ]; then
	mkdir -p /var/lib/sss/pubconf/krb5.include.d
fi

chown -R sssd:sssd /var/lib/sss/
exit 0
