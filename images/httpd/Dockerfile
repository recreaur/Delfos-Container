ARG VERSION=latest

FROM httpd:${VERSION}

ARG USER=1000

# Instalar mod-jk
RUN apt-get update \
  && apt-get install -y --no-install-recommends libapache2-mod-jk \
  && rm -r /var/lib/apt/lists/*

RUN echo "" >> /usr/local/apache2/conf/httpd.conf
RUN echo "Include /etc/apache2/mods-available/jk.load" >> /usr/local/apache2/conf/httpd.conf

COPY ./workers.properties /usr/local/apache2/conf/workers.properties

# Personalización httpd
COPY ./my-httpd.conf /tmp/httpd.conf
RUN echo "" >> /usr/local/apache2/conf/httpd.conf \
  && cat /tmp/httpd.conf >> /usr/local/apache2/conf/httpd.conf \
  && rm /tmp/httpd.conf

# Establecer los permisos adecuados
RUN mkdir /var/log/apache2
RUN chown -R ${USER}:${USER} /usr/local/apache2 /var/log/apache2

USER ${USER}
