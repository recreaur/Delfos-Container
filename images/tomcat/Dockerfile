ARG VERSION=latest

FROM tomcat:${VERSION}

ARG USER=1000

## Cambiar LOCALE
RUN apt-get update
RUN apt-get install -y locales locales-all
ENV LC_ALL es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES.UTF-8
##

# Personalizar tomcat-users.xml
ADD users.txt /tmp/users.txt
RUN sed -i -e '/<\/tomcat-users>/{r /tmp/users.txt'  -e 'd}' /usr/local/tomcat/conf/tomcat-users.xml \
  && rm /tmp/users.txt

# Personalizar server.xml
ADD connectors.txt /tmp/connectors.txt
RUN sed -i -e '/Define an AJP 1.3 Connector on port 8009/r /tmp/connectors.txt' /usr/local/tomcat/conf/server.xml \
  && rm /tmp/connectors.txt
	
RUN chown -R ${USER}:${USER} /usr/local/tomcat

USER ${USER}


