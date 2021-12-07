#!/bin/sh

if [ -z $BASIC_AUTH_PASSWORD ]; then
  echo BASIC_AUTH_PASSWORD is not set!
  exit 1
fi

if [ -z $BASIC_AUTH_USERNAME ]; then
  echo BASIC_AUTH_PASSWORD is not set!
  exit 1
fi

CRYPTPASS=`openssl passwd -crypt $BASIC_AUTH_PASSWORD`

echo "$BASIC_AUTH_USERNAME:$CRYPTPASS" > /etc/nginx/.htpasswd