#!/bin/bash

# Configuration
###############
export WEBENGINE_MAXMEMORY=${WEBENGINE_MAXMEMORY:-1000}
export WEBENGINE_PORT=${WEBENGINE_PORT:-8080}
export WEBENGINE_IP=${WEBENGINE_IP:-127.0.0.1}
export WEBENGINE_PEERNAME=${WEBENGINE_PEERNAME:-WEBENGINE}

# Replace maximum amount of memory used by the jvm
##################################################

if [ ! -f /home/WebEngine/tomcat/bin/setenv.sh.orig ]; then
    cp /home/WebEngine/tomcat/bin/setenv.sh /home/WebEngine/tomcat/bin/setenv.sh.orig
else
    cp /home/WebEngine/tomcat/bin/setenv.sh.orig /home/WebEngine/tomcat/bin/setenv.sh
fi

sed -i -e "s/-Xmx3000m/-Xmx${WEBENGINE_MAXMEMORY}m/g" /home/WebEngine/tomcat/bin/setenv.sh

# Replace used port
##################################################

if [ ! -f /home/WebEngine/tomcat/conf/server.xml.orig ]; then
    cp /home/WebEngine/tomcat/conf/server.xml /home/WebEngine/tomcat/conf/server.xml.orig
else
    cp /home/WebEngine/tomcat/conf/server.xml.orig /home/WebEngine/tomcat/conf/server.xml
fi

sed -i -e "s/port=\"8080\"/port=\"${WEBENGINE_PORT}\"/g" /home/WebEngine/tomcat/conf/server.xml

# Configure Peer Port, localhost and peer name
#################################################

if [ ! -f /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties.orig ]; then
    cp /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties \
       /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties.orig
else
    cp /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties.orig \
       /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties
fi

sed -i -e "s/config\.peer\.port=8080/config\.peer\.port=${WEBENGINE_PORT}/g" /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties
sed -i -e "s/config.crawler.localHost = /config.crawler.localHost = ${WEBENGINE_IP}/g" /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties
sed -i -e "s/peer.name=WebEngine/peer.name=${WEBENGINE_PEERNAME}/g" /home/WebEngine/tomcat/wtpwebapps/webengine/WEB-INF/classes/com/webengine/application.properties

