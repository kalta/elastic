FROM kibana:5.0.2
RUN kibana-plugin install x-pack
RUN chown -R kibana /usr/share/kibana
COPY kibana.yml /tmp
RUN cat /tmp/kibana.yml >> /etc/kibana/kibana.yml
