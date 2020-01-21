#!/bin/bash
set -e
trap '[ -z "$child" ] || kill -INT $child' EXIT
trap '[ -z "$child" ] || kill -TERM $child' TERM
trap '[ -z "$child" ] || kill -INT $child' INT

mkdir -p /var/www/letsencrypt

nginx -g "daemon off;" &
child=$!

[ -d "/etc/letsencrypt/live/test.davidrios.dev" ] || certbot certonly -n --webroot -w /var/www/letsencrypt --cert-name test.davidrios.dev --agree-tos --email david.rios.gomes@gmail.com -d test.davidrios.dev
certbot renew

cp /root/test.conf /etc/nginx/conf.d
nginx -s reload
wait "$child"