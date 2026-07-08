### Deploy by docker run
**CMDbuild with demo database**  
```bash
docker compose up -d --wait
```  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz
* test.dump.xz

#### Please change credentials for postgres and tomcat server
* @ cmdbuild-4.2.0/docker-compose.yml - idealy using enviroment variables
* @ cmdbuild-4.2.0/files/context.xml
* @ cmdbuild-4.2.0/files/tomcat-users.xml


#### Credentials and access to Cmdbuild
* **Link to CMDbuild app** - http://localhost:8090/cmdbuild/ui/
* **username** - admin (default)
* **password** - admin (default)

#### Credentials and access to Cmdbuild Database 
* **Link to CMDbuild app** - cmdbuild_db:5432
* **username** - postgres (default)
* **password** - postgres (default)

#### Credentials and access to Tomcat
* **Link to Tomcat manager** - http://localhost:8090/manager
* **username** - admin
* **password** - password

#### Credentials and access to PGAdmin
* **Link to Tomcat manager** - http://localhost:5050
* **username** - admin@example.com
* **password** - admin