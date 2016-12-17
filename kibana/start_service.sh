#!/bin/bash
IMAGE=netcomposer/kibana:5.0.2-1
ES="http://elastic_openresty:9200"

docker service create \
	--name kibana \
	--network elastic \
	-p 5601:5601 \
	--env "ELASTICSEARCH_URL=$ES" \
	--env "SERVER_PORT=5601" \
	$IMAGE 

	