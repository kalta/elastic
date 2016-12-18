#!/bin/bash
IMAGE=netcomposer/elastic-proxy:0

docker service create \
	--constraint 'node.hostname==k1.netc.io' \
	--name elastic_proxy \
	--network elastic \
	--secret elastic_passwords \
	--secret kibana_passwords \
	-p 9201:9201 \
	-p 9202:9202 \
	--mount type=bind,src=/etc/letsencrypt,dst=/etc/letsencrypt:ro \
	$IMAGE

#	--restart unless-stopped \

