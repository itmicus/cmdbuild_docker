# Stage 1: Builder — extract WAR
FROM eclipse-temurin:21-jdk-noble AS builder

WORKDIR /extract

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip

COPY files/cmdbuild-4.2.0.war /tmp/cmdbuild-4.2.0.war
RUN mkdir -p /extract/cmdbuild \
    && unzip /tmp/cmdbuild-4.2.0.war -d /extract/cmdbuild \
    && rm /tmp/cmdbuild-4.2.0.war

# Stage 2: Final image
FROM tomcat:11.0.13-jdk21-temurin-noble

WORKDIR $CATALINA_HOME

ENV POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=postgres \
    POSTGRES_PORT=5432 \
    POSTGRES_HOST=cmdbuild_db \
    POSTGRES_DB=cmdbuild_4 \
    CMDBUILD_DB_USER=cmdbuild \
    CMDBUILD_DB_PASSWORD=cmdbuild \
    CMDBUILD_DUMP=demo \
    JAVA_OPTS="-Xmx6000m -Xms3000m"

# PostgreSQL client repo
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt noble-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg

# Install dependencies, create tomcat user, set up directories
RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-client-17 curl \
    && groupadd tomcat \
    && useradd -s /bin/false -g tomcat -d $CATALINA_HOME tomcat \
    && mkdir -p $CATALINA_HOME/conf/cmdbuild \
    && rm -rf $CATALINA_HOME/webapps.dist \
    && rm -rf /var/lib/apt/lists/*

# Copy extracted application from builder
COPY --from=builder /extract/cmdbuild $CATALINA_HOME/webapps/cmdbuild

# Copy configuration files
COPY files/tomcat-users.xml $CATALINA_HOME/conf/
COPY files/context.xml $CATALINA_HOME/webapps/manager/META-INF/
COPY files/database.conf $CATALINA_HOME/conf/cmdbuild/
COPY files/docker-entrypoint.sh /usr/local/bin/
COPY files/postgresql-42.7.3.jar $CATALINA_HOME/lib/

# Remove Manager app for security
RUN rm -rf $CATALINA_HOME/webapps/manager \
    && rm -rf $CATALINA_HOME/webapps/host-manager \
    && chmod +x $CATALINA_HOME/webapps/cmdbuild/cmdbuild.sh \
    && chmod +x /usr/local/bin/docker-entrypoint.sh \
    && chown -R tomcat:tomcat $CATALINA_HOME \
    && chown tomcat:tomcat /usr/local/bin/docker-entrypoint.sh
    
USER tomcat

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=120s --retries=5 \
    CMD curl -f -L http://localhost:8080/cmdbuild/ui || exit 1

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["catalina.sh", "run"]