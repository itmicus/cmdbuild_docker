FROM postgres:10.7

MAINTAINER LLC Itmicus <order@itmicus.ru>

ENV POSTGIS_MAJOR 2.5
ENV POSTGRES_USER postgres
ENV POSTGRES_PASS postgres

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
      postgresql-10-postgis-$POSTGIS_MAJOR \
      postgresql-10-postgis-scripts \
      && rm -rf /var/lib/apt/lists/*

# cleanup
RUN apt-get -qy autoremove


RUN mkdir -p /docker-entrypoint-initdb.d
