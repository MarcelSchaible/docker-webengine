#
#
#
#FROM ubuntu:18.04
FROM ubuntu-base:latest
MAINTAINER Marcel Schaible (marcel.schaible@fernuni-hagen.de)

#
#
#
RUN apt-get update

#
#
#
RUN apt-get install -y git vim htop tmux mc iproute2 iputils-ping wget unzip net-tools
RUN apt-get install -y openjdk-8-jdk

#
#
#
WORKDIR /tmp
RUN git clone https://github.com/MarcelSchaible/docker-webengine.git

WORKDIR /home
RUN wget http://www.docanalyser.de/webengine/webengine.zip
RUN unzip webengine.zip
RUN rm webengine.zip
RUN ln -s WebEngineV* WebEngine
RUN chmod +x /home/WebEngine/tomcat/bin/*.sh
RUN rm -rf /home/WebEngine/tomcat/webapps/documents

COPY webengine-config.sh webengine-config.sh
RUN chmod +x webengine-config.sh

COPY start-webengine.sh start-webengine.sh
RUN chmod +x start-webengine.sh

COPY logs-webengine.sh logs-webengine.sh
RUN chmod +x logs-webengine.sh

COPY set-timezone.sh set-timezone.sh
RUN chmod +x set-timezone.sh
xRUN ./set-timezone.sh

#COPY <filename>.jar /<filename>.jar
#ENTRYPOINT ["/bin/bash" , "-c", "/home/entrypoint.sh"]

