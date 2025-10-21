### Deploy by docker run

**CMDbuild Ready2use 2.7**  
```bash
docker-compose -f ready2use-2.4-4.1.0/docker-compose.yml up -d
```  
#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz

#### Please change credentials for postgres and tomcat server
* @ ready2use-2.4-4.1.0/docker-compose.yml - idealy using enviroment variables
* @ ready2use-2.4-4.1.0/files/context.xml
* @ ready2use-2.4-4.1.0/files/tomcat-users.xml

#### Credentials and access to OM
* **Link to CMDbuild Ready2use** - http://localhost:8090/cmdbuild/ui/
* **username** - admin (default)
* **password** - admin (default)