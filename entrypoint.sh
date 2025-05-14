#!/bin/bash
set -e

# Wenn ENV-Ersetzung gewünscht ist, verarbeite pdns.conf als Template
if [ -f /etc/powerdns/pdns.conf ]; then
  envsubst < /etc/powerdns/pdns.conf > /etc/powerdns/pdns.conf.rendered
  mv /etc/powerdns/pdns.conf.rendered /etc/powerdns/pdns.conf
fi

# Starte PowerDNS im Vordergrund ohne Guardian
exec /usr/sbin/pdns_server --daemon=no --guardian=no
