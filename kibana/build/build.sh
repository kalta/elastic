NAME=netcomposer/kibana:5.0.2-1
docker build -t $NAME . && docker push $NAME