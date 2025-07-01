#!/bin/sh
set -e

if [ -f /etc/powerdns/pdns.conf.template ]; then
  echo "Substituting environment variables in pdns.conf.template..."
  envsubst < /etc/powerdns/pdns.conf.template > /etc/powerdns/pdns.conf
fi

exec pdns_server --config-dir=/etc/powerdns
