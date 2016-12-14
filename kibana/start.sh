#!/bin/bash
NAME=kibana
IMAGE=netcomposer/kibana:5.0.2-1

docker rm $NAME > /dev/null 2>&1 
docker run --rm --name $NAME --net=host \
	-e "ELASTICSEARCH_URL=http://127.0.0.1:9200" \
	-e "SERVER_PORT=5601" \
	$IMAGE 

#-p 5601:5601
	