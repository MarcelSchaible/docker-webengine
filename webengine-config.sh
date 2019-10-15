#!/bin/bash

# Configuration
###############
export WEBENGINE_MAXMEMORY=1000
export WEBENGINE_PORT=29000
export WEBENGINE_IP=192.168.0.56
export WEBENGINE_PEERNAME=AUTSYS2019

# Replace maximum amount of memory used by the jvm
##################################################
sed -i -e "s/-Xmx3000m/-Xmx${WEBENGINE_MAXMEMORY}m/g" /home/WebEngine/tomcat/bin/setenv.sh

# Replace used port
##################################################
sed -i -e "s/port=\"8080\"/port=\"${WEBENGINE_PORT}\"/g" /home/WebEngine/tomcat/conf/server.xml
sed -i -e "s/config\.peer\.port=8080/config\.peer\.port=${WEBENGINE_PORT}/g" /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties
sed -i -e "s/config.crawler.localHost = /config.crawler.localHost = ${WEBENGINE_IP}/g" /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties
sed -i -e "s/peer.name=WebEngine/peer.name=${WEBENGINE_PEERNAME}/g" /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties

