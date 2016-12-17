#!/bin/bash
IMAGE=netcomposer/elastic-openresty:1.11.2-0

docker service create \
	--name elastic_openresty \
	--network elastic \
	-p 9201:9200 \
	--mount type=bind,src=/etc/letsencrypt,dst=/etc/letsencrypt:ro \
	$IMAGE

#	--restart unless-stopped \

