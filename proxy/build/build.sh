# You must set 
# /usr/local/openresty/nginx/conf/elastic_passwords and
# /usr/local/openresty/nginx/conf/kibana_passwords


NAME="netcomposer/elastic-proxy:0"
docker build -t $NAME  .  && docker push $NAME

