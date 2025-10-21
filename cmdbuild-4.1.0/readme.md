### Deploy by docker run
**CMDbuild with demo database**  
```bash
docker-compose -f 4.1.0/docker-compose.yml up -d
```  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz
* test.dump.xz

#### Please change credentials for postgres and tomcat server
* @ 4.1.0/docker-compose.yml - idealy using enviroment variables
* @ 4.1.0/files/context.xml
* @ 4.1.0/files/tomcat-users.xml

#### Credentials and access to OM
* **Link to CMDbuild** - http://localhost:8090/cmdbuild/ui/
* **username** - admin (default)
* **password** - admin (default)