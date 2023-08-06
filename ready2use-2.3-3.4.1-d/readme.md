### Deploy by docker run

**CMDbuild Ready2use 2.3**  
```bash  
docker run --name cmdbuild_db -p 5432:5432 -d itmicus/cmdbuild:db-3.0
docker run --name cmdbuild_app --restart unless-stopped -e CMDBUILD_DUMP="ready2use_demo.dump.xz" --link cmdbuild_db  -p 8090:8080 -d itmicus/cmdbuild:r2u-2.3-3.4.1-d
```  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz

#### Please change credentials for postgres and tomcat server
* @ ready2use-2.3-3.4.1-d/docker-compose.yml - idealy using enviroment variables
* @ ready2use-2.3-3.4.1-d/files/context.xml
* @ ready2use-2.3-3.4.1-d/files/tomcat-users.xml

#### Credentials and access to OM
* **Link to OM** - http://localhost:8090/cmdbuild/ui/
* **username** - admin (default)
* **password** - admin (default)