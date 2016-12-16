#!/bin/bash
NAME=elastic_${HOSTNAME//\./_}
IMAGE=netcomposer/elasticsearch:5.0.2-3

docker rm $NAME > /dev/null 2>&1

docker create --rm \
	--name $NAME \
	--network elastic \
	--hostname $NAME \
	-v elastic_slave_data:/usr/share/elasticsearch/data \
	--env "ES_JAVA_OPTS=-Xms1g -Xmx1g" \
	$IMAGE \
		-Enode.name="$NAME" \
		-Ecluster.name="NetComposer" \
		-Etransport.host="_eth0_" \
		-Ehttp.host="_eth2_" \
		-Ediscovery.zen.ping.unicast.hosts=elastic_master:9300

docker network connect openresty $NAME

docker start -a $NAME
