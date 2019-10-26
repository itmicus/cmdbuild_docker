#!/bin/sh

# build images and set tags
docker build -t itmicus/cmdbuild:db-3.0 3.0/postgres/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.ru>"
docker build -t itmicus/cmdbuild:app-3.1 3.1/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.ru>"
docker build -t itmicus/cmdbuild:app-3.1.1 3.1.1/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.ru>"
docker build -t itmicus/cmdbuild:r2u-2.0 ready2use-2.0/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.ru>"
docker build -t itmicus/cmdbuild:r2u-2.0-3.1.1 ready2use-2.0-3.1.1/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.ru>"