FROM elasticsearch:5.0.2
RUN elasticsearch-plugin install --batch x-pack
COPY elasticsearch.yml /tmp
#RUN cat /tmp/elasticsearch.yml >> /etc/elasticsearch/elasticsearch.yml
RUN cat /tmp/elasticsearch.yml >> /usr/share/elasticsearch/config/elasticsearch.yml
