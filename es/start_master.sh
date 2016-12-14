#!/bin/bash
NAME=elastic_master
IMAGE=netcomposer/elasticsearch:5.0.2-1
HTTP=9200
TRANSPORT=9300
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker rm $NAME > /dev/null 2>&1
docker run --rm --name $NAME \
	-v $DIR/data:/usr/share/elasticsearch/data \
	-p 9200:9200 -p 9300:9300 \
	$IMAGE \
		-Ecluster.name="NetComposer" \
		-Ehttp.port=$HTTP \
		-Etransport.tcp.port=$TRANSPORT \
		-Ediscovery.zen.ping.unicast.hosts=127.0.0.1:9300


	# -m 1G \
	# -e "ES_JAVA_OPTS=-Xms1g -Xmx1g" \


	# -Ebootstrap.memory_lock=true 
	# --cap-add=IPC_LOCK --ulimit memlock=-1:-1 # Better to disable swap
	# --ulimit nofile=65536:65536 				# Already in docker!
	# -Enode.name="$NAME" \
