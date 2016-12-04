#!/bin/bash
NAME=elastic_slave_1
IMAGE=netcomposer/elasticsearch:5.0.2-1
HTTP=9201
TRANSPORT=9301

docker rm $NAME 2>&1 > /dev/null
docker run --rm --name $NAME --net=host \
	-v /tmp/$NAME:/usr/share/elasticsearch/data \
	--cap-add=IPC_LOCK --ulimit memlock=-1:-1 --ulimit nofile=65536:65536 \
	$IMAGE \
		-Enode.name="$NAME" \
		-Ecluster.name="NetComposer" \
		-Ebootstrap.memory_lock=true \
		-Ehttp.port=$HTTP \
		-Etransport.tcp.port=$TRANSPORT \
		-Ediscovery.zen.ping.unicast.hosts=127.0.0.1:9300


	# -p 9200:9200 -p 9300:9300 \
	# -m 1G \
	# -e "ES_JAVA_OPTS=-Xms1g -Xmx1g" \
