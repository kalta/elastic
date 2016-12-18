#!/bin/sh

cp /run/secrets/elastic_passwords /usr/local/openresty/nginx/conf/elastic_passwords
cp /run/secrets/kibana_passwords /usr/local/openresty/nginx/conf/kibana_passwords
exec /usr/local/openresty/bin/openresty
