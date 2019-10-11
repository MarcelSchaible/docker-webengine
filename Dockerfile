#
#
#
#FROM ubuntu:18.04
FROM ubuntu-base:latest
MAINTAINER Marcel Schaible (marcel.schaible@fernuni-hagen.de)

#
#
#
#RUN apt-get update

#
#
#
#RUN apt-get install -y git vim htop tmux mc iproute2 iputils-ping wget unzip
#RUN apt-get install -y openjdk-8-jdk

#
#
#
WORKDIR /tmp
RUN git clone https://github.com/MarcelSchaible/docker-webengine.git
CMD pwd
CMD ls

WORKDIR /home
RUN wget http://www.docanalyser.de/webengine/webengine.zip
RUN unzip webengine.zip
RUN rm webengine.zip
RUN ln -s WebEngineV* WebEngine
RUN chmod +x /home/WebEngine/tomcat/bin/*.sh

COPY webengine-config webengine-config
RUN chmod +x webengine-config
RUN ./webengine-config
#COPY <filename>.jar /<filename>.jar
#ENTRYPOINT ["/bin/bash" , "-c", "./webengine-config"]


#
#
#
ENV TZ Europe/Berlin
