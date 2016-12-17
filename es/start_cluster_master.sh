#!/bin/bash
NAME=elastic_master
IMAGE=netcomposer/elasticsearch:5.0.2-3

docker rm $NAME > /dev/null 2>&1

docker run  \
	-d \
	--name $NAME \
	--network elastic \
	--hostname $NAME \
	--network-alias elastic \
	-v elastic_master_data:/usr/share/elasticsearch/data \
	--env "ES_JAVA_OPTS=-Xms1g -Xmx1g" \
	$IMAGE \
		-Enode.name="$NAME" \
		-Ecluster.name="NetComposer" \
		-Ediscovery.zen.ping.unicast.hosts=127.0.0.1:9300 


