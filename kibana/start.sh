#!/bin/bash
NAME=kibana
IMAGE=netcomposer/kibana:5.0.2-1

docker rm $NAME > /dev/null 2>&1 
docker run -ti --rm --name $NAME --net=host \
	-e "ELASTICSEARCH_URL=http://k2.netc.io:80/es/" \
	-e "ELASTICSEARCH_USERNAME=test" \
	-e "ELASTICSEARCH_PASSWORD=es" \
	-e "SERVER_PORT=5601" \
	$IMAGE 

#-p 5601:5601
	