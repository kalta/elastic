#!/bin/bash
# https://www.elastic.co/guide/en/logstash/current/command-line-flags.html
# --node.name
# -f <file>: read a single file
# --path.config <path>: reads all files
# --path.data <path>: write directort for data
# -t check for errors
# -r automatic reload
# --config.debug


NAME=logstash
IMAGE=netcomposer/logstash:5.0.2-1

docker rm $NAME > /dev/null 2>&1

docker create -ti --name $NAME --net=host \
	$IMAGE -f /etc/logstash/logstash.conf --config.debug &&
docker cp config/logstash.conf $NAME:/etc/logstash &&
docker start -ia $NAME


	#~/pipeline/:/usr/share/logstash/pipeline/ 
	#/usr/share/logstash/config/logstash.yml