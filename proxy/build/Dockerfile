# See https://github.com/openresty/docker-openresty/blob/master/alpine/Dockerfile
FROM openresty/openresty:1.11.2.2-alpine

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY profile.sh /etc/profile.d/netcomposer.sh
COPY start.sh /root/start.sh

ENTRYPOINT ["/root/start.sh"]