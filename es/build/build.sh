NAME=netcomposer/elasticsearch:5.0.2-3
docker build -t $NAME  . && \
docker push $NAME

#--ulimit nofile=65536:65536 --ulimit memlock=-1:-1 