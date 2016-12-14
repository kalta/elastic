# Starts service in all nodes that have label elastic=1
# For the first install a single node should have it (put it to next number,
# the update the others)
# Inside the overlay, connect to 'elastic:9200' to distribute the query
# Outside the cluster, to IP:9200 on any of the nodes
# Inside, tasks.elastic gives all the IPS
# It creates a unnamed volume for the data

IMAGE=netcomposer/elasticsearch:5.0.2-3
docker service create \
	--name elastic \
	--network elastic \
	--constraint 'node.labels.elastic==2' \
	--container-label 'cl=1' \
	--mode global \
	-p 9200:9200  \
	--mount dst=/usr/share/elasticsearch/data \
	$IMAGE \
		-Enetwork.host='${HOSTNAME}' \
		-Ecluster.name="NetComposer" \
		-Ediscovery.zen.ping.unicast.hosts=tasks.elastic:9300

	# -m 1G \
	# -e "ES_JAVA_OPTS=-Xms1g -Xmx1g" \
