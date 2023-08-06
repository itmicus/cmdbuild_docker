#FROM tomcat:9.0.53-jdk11-openjdk
#FROM tomcat:9.0.65-jdk11-openjdk
FROM tomcat:9.0.71-jdk17-temurin


WORKDIR $CATALINA_HOME

ENV CMDBUILD_URL https://sourceforge.net/projects/cmdbuild/files/3.4/cmdbuild-3.4.war/download
ENV POSTGRES_USER postgres
ENV POSTGRES_PASS postgres
ENV POSTGRES_PORT 5432
ENV POSTGRES_HOST cmdbuild_db
ENV POSTGRES_DB cmdbuild_db3
ENV CMDBUILD_DUMP demo

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
    maven \
	postgresql-client \
    zip unzip

RUN set -x \
 	&& mkdir $CATALINA_HOME/conf/cmdbuild/ \
 	&& mkdir $CATALINA_HOME/webapps/cmdbuild/

COPY files/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml
COPY files/context.xml $CATALINA_HOME/webapps/manager/META-INF/context.xml
COPY files/database.conf $CATALINA_HOME/conf/cmdbuild/database.conf
COPY files/docker-entrypoint.sh /usr/local/bin/

# Warning for /usr/local/tomcat/native-jni-lib/libtcnative-1.so.0.2.35: libssl.so.1.1: cannot open shared object file: No such file or directory
# using solution from here https://stackoverflow.com/a/72633324
# RUN apt-get install libssl1.1

RUN set -x \
	&& groupadd tomcat \
	&& useradd -s /bin/false -g tomcat -d $CATALINA_HOME tomcat \
	&& cd /tmp \
	&& wget -O cmdbuild.war --no-check-certificate "$CMDBUILD_URL" \
	&& chmod 777 cmdbuild.war \
	&& chmod 777 /usr/local/bin/docker-entrypoint.sh \
	&& unzip cmdbuild.war -d cmdbuild \
	&& mv cmdbuild.war $CATALINA_HOME/webapps/cmdbuild.war \
	&& mv cmdbuild/* $CATALINA_HOME/webapps/cmdbuild/ \
	&& chmod 777 $CATALINA_HOME/webapps/cmdbuild/cmdbuild.sh \
	&& chown tomcat -R $CATALINA_HOME \
	&& cd /tmp \
	&& rm -rf * \
	&& rm -rf /var/lib/apt/lists/*

# cleanup
RUN apt-get -qy autoremove

ENTRYPOINT /usr/local/bin/docker-entrypoint.sh

USER tomcat

EXPOSE 8080

CMD ["catalina.sh", "run"]
