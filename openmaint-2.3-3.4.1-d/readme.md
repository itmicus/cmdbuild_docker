### Deploy by docker run
**openMAINT with demo database**  
```bash
docker run --name openmaint_db -p 5432:5432 -d itmicus/cmdbuild:db-3.0
docker run --name openmaint_app --restart unless-stopped -e CMDBUILD_DUMP="demo.dump.xz" --link openmaint_db  -p 8090:8080 -d afcarvalho1991/cmdbuild:om-2.3-3.4.1-d
```  
or simply run
```bash
docker compose -d -f openmaint-2.3-3.4.1-d/docker-compose.yml up
```  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz

#### Please change credentials for postgres and tomcat server
* @ openmaint-2.3-3.4.1-d/docker-compose.yml - idealy using enviroment variables
* @ openmaint-2.3-3.4.1-d/files/context.xml
* @ openmaint-2.3-3.4.1-d/files/tomcat-users.xml
#### Credentials and access to OM
* **Link to OM** - http://localhost:8090/cmdbuild/ui/
* **username** - admin (default)
* **password** - admin (default)