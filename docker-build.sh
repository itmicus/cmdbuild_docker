#!/bin/sh

# build images and set tags
# cmdbuild
docker build -t itmicus/cmdbuild:4.2.0 cmdbuild-4.2.0/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:4.1.0 cmdbuild-4.1.0/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"

# ready2use
docker build -t itmicus/cmdbuild:r2u-2.4-4.1.0 ready2use-2.4-4.1.0/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"

#openMAINT
docker build -t itmicus/cmdbuild:om-2.4-4.1.0 openmaint-2.4-4.1.0/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
