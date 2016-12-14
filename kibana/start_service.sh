#!/bin/bash
IMAGE=netcomposer/kibana:5.0.2-1

docker service create --name kibana	--network elastic -p 5601:5601 -e "ELASTICSEARCH_URL=http://elastic:9200" -e "SERVER_PORT=5601" $IMAGE 

	