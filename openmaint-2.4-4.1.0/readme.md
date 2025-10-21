### Deploy by docker run
**openMAINT with demo database**  
```bash
docker-compose -f openmaint-openmaint-2.4-4.1.0/docker-compose.yml up -d
```  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz

#### Please change credentials for postgres and tomcat server
* @ openmaint-openmaint-2.4-4.1.0/docker-compose.yml - idealy using enviroment variables
* @ openmaint-openmaint-2.4-4.1.0/files/context.xml
* @ openmaint-openmaint-2.4-4.1.0/files/tomcat-users.xml
#### Credentials and access to OM
* **Link to OM** - http://localhost:8090/cmdbuild/ui/
* **username** - admin (default)
* **password** - admin (default)