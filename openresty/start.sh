#!/bin/bash
IMAGE=netcomposer/elastic-openresty:1.11.2-0

docker rm elastic_openresty > /dev/null 2>&1

docker run \
	-ti \
	--name elastic_openresty \
	--network elastic \
	-p 9201:9200 \
	-v /etc/letsencrypt:/etc/letsencrypt:ro \
	$IMAGE

#	--restart unless-stopped \

