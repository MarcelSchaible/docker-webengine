docker run -it                                                                                     \
       -v /home/pi/webengine-documents:/home/WebEngine/tomcat/webapps/documents                    \
       -v /home/pi/webengine-data/crawler:/home/WebEngine/tomcat/bin/crawler                       \
       -v /home/pi/webengine-data/index:/home/WebEngine/tomcat/bin/index                           \
       -v /home/pi/webengine-data/graphdatabase_de:/home/WebEngine/tomcat/bin/graphdatabase_de     \
       -v /home/pi/webengine-data/graphdatabase_en:/home/WebEngine/tomcat/bin/graphdatabase_en     \
       -e WEBENGINE_PORT=30000 \
       -p 29000:29000 webengine:latest bash
