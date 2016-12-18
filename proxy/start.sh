#!/bin/bash
IMAGE=netcomposer/elastic-proxy:0
NAME=elastic_proxy

docker rm $NAME > /dev/null 2>&1

docker run \
	-ti \
	--name $NAME \
	--network elastic \
	-p 9201:9201 \
	-p 9202:9202 \
	-v /etc/letsencrypt:/etc/letsencrypt:ro \
	$IMAGE

#	--restart unless-stopped \

