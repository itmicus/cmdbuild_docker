FROM tomcat:8.5.42-jdk8-openjdk

WORKDIR /usr/local/tomcat

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

ENV CMDBUILD_URL https://sourceforge.net/projects/cmdbuild/files/3.0/cmdbuild-3.0.war/download

RUN set -x \
	&& cd /tmp \
	&& wget "$CMDBUILD_URL" \
	&& mv cmdbuild*.war /usr/local/tomcat/webapps/cmdbuild*.war 

EXPOSE 8080
CMD ["catalina.sh", "run"]



# 
# #

# # see https://www.apache.org/dist/tomcat/tomcat-8/KEYS
# RUN set -ex \
# 	&& for key in \
# 		05AB33110949707C93A279E3D3EFE6B686867BA6 \
# 		07E48665A34DCAFAE522E5E6266191C37C037D42 \
# 		47309207D818FFD8DCD3F83F1931D684307A10A5 \
# 		541FBE7D8F78B25E055DDEE13C370389288584E7 \
# 		61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
# 		713DA88BE50911535FE716F5208B0AB1D63011C7 \
# 		79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
# 		9BA44C2621385CB966EBA586F72C284D731FABEE \
# 		A27677289986DB50844682F8ACB77FC2E86E29AC \
# 		A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
# 		DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
# 		F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
# 		F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23 \
# 	; do \
# 		gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
# 	done

# ENV TOMCAT_MAJOR 7
# ENV TOMCAT_VERSION 7.0.68
# ENV CMDBUILD_VERSION 2.5.0
# ENV TOMCAT_TGZ_URL http://archive.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
# 
# ENV SHARK_URL http://downloads.sourceforge.net/project/cmdbuild/$CMDBUILD_VERSION/shark-cmdbuild-$CMDBUILD_VERSION.zip

# # ENV LIB http://jdbc.postgresql.org/download/postgresql-9.4.1208.jar Don't need with the last version of cmdbuild
# # Temporary, will be updated for the next version #

# RUN set -x \
# 	&& curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
# 	&& curl -fSL "$TOMCAT_TGZ_URL.asc" -o tomcat.tar.gz.asc \
# 	&& gpg --batch --verify tomcat.tar.gz.asc tomcat.tar.gz \
# 	&& tar -xvf tomcat.tar.gz --strip-components=1 \
# 	&& rm bin/*.bat \
# 	&& rm tomcat.tar.gz* \
# 	&& cd /opt \
# 	&& wget "$CMDBUILD_URL" \
# 	&& mv cmdbuild* cmdbuild.zip \
# 	&& unzip cmdbuild.zip \
# 	&& rm -rf cmdbuild.zip \
# 	&& mv cmdbuild* cmdbuild \
# 	&& cd /opt/cmdbuild/ \
# 	&& mkdir temp \
# 	&& mv *.war temp/ \
# 	&& cd temp \
# 	&& mv cmdbuild*.war cmdbuild.war \
# 	&& unzip cmdbuild.war \
# 	&& mv cmdbuild.war /usr/local/tomcat/webapps/cmdbuild.war \
# 	&& mkdir /usr/local/tomcat/webapps/cmdbuild/ \
# 	&& mv * /usr/local/tomcat/webapps/cmdbuild/ \
# 	&& cd "/opt/cmdbuild/extras/tomcat-libs/6.0 or higher" \
# 	&& mv *.jar /usr/local/tomcat/lib \
# 	&& cd /opt \
# 	&& wget "$SHARK_URL" \
# 	&& unzip shark-cmdbuild-$CMDBUILD_VERSION.zip \
# 	&& rm -rf shark-cmdbuild-$CMDBUILD_VERSION.zip \
# 	&& cd shark-cmdbuild-$CMDBUILD_VERSION \
# 	&& mv cmdbuild-shark-server*.war shark.war \
# 	&& unzip shark.war \
# 	&& mv shark.war /usr/local/tomcat/webapps/shark.war \
# 	&& mkdir /usr/local/tomcat/webapps/shark/ \
# 	&& mv * /usr/local/tomcat/webapps/shark/ \
# 	&& cd /opt \
# 	&& rm -rf *
	

# COPY context.xml /usr/local/tomcat/webapps/shark/META-INF/context.xml
	

# EXPOSE 8080
# CMD ["catalina.sh", "run"]