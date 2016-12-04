FROM logstash:5.0.2

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json

RUN logstash-plugin install logstash-input-gelf
COPY logstash.yml /tmp
#RUN cat /tmp/logstash.yml >> /usr/share/logstash/config/logstash.yml