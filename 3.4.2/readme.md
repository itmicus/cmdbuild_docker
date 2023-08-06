### Deploy by docker run
**CMDbuild with demo database**  
```bash
docker run --name cmdbuild_db -p 5432:5432 -d itmicus/cmdbuild:db-3.0
docker run --name cmdbuild_app --link cmdbuild_db -p 8090:8080 -d itmicus/cmdbuild:app-3.4.2
``` 
or simply run
```bash
docker-compose -f 3.4.2/docker-compose.yml up -d
```  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz

#### Please change credentials for postgres and tomcat server
* @ 3.4.2/docker-compose.yml - idealy using enviroment variables
* @ 3.4.2/files/context.xml
* @ 3.4.2/files/tomcat-users.xml

#### Credentials and access to OM
* **Link to OM** - http://localhost:8090/cmdbuild/ui/
* **username** - admin (default)
* **password** - admin (default)