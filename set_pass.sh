#!/bin/bash
EP=elastic_passwords
KP=kibana_passwords

docker secret rm $EP > /dev/null 2>&1
docker secret rm $KP > /dev/null 2>&1
PASS=$(openssl passwd $1)
echo "user:$PASS" | docker secret create $EP && \
echo "user:$PASS" | docker secret create $KP && \
docker service update --secret-add $EP --secret-add $KP elastic_proxy