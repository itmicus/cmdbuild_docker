#!/bin/sh
VERSION=3.0

# build images and set tags
docker build -t itmicus/cmdbuild:db-$VERSION $VERSION/postgres/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.ru>"
docker build -t itmicus/cmdbuild:app-$VERSION $VERSION/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.ru>"