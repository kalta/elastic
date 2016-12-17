#!/bin/bash
NAME=elastic_${HOSTNAME//\./_}
IMAGE=netcomposer/elasticsearch:5.0.2-3

docker rm $NAME > /dev/null 2>&1

docker run -d \
	--name $NAME \
	--network elastic \
	--hostname $NAME \
	--network-alias elastic \
	-v elastic_slave_data:/usr/share/elasticsearch/data \
	--env "ES_JAVA_OPTS=-Xms1g -Xmx1g" \
	$IMAGE \
		-Enode.name="$NAME" \
		-Ecluster.name="NetComposer" \
		-Ediscovery.zen.ping.unicast.hosts=elastic_master:9300

