FROM debian:jessie

RUN apt-get update && apt-get install -y wget apt-transport-https && \
	wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
	echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-5.x.list && \
	apt-get update && apt-get install -y filebeat=5.0.2 && \
	apt-get clean

#RUN update-rc.d filebeat defaults 95 10