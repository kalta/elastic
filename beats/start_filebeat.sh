#!/bin/bash
# -configtest
# -d <selectors> enable debugging for this selectors
# -e log to stderr instead of syslog/file
# -v verbose

NAME=filebeat
IMAGE=netcomposer/beats:5.0.2-1

docker rm $NAME > /dev/null 2>&1 

docker create -ti --name $NAME --net=host \
	-v /:/hostfs:ro \
	$IMAGE /usr/share/filebeat/bin/filebeat -path.config=/etc/filebeat -d "*" -e

docker cp config/filebeat.yml $NAME:/etc/filebeat

docker start -ia $NAME
