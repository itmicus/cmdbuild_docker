# CMDBuild 3 with READY2USE 2.0 and openMAINT 2.0 in Docker

## CMDBuild
![cmdbuild_logo](https://www.tecnoteca.com/immagini/logo_cmdbuild.png/@@images/bf2e13f9-7a90-4e41-ba76-cf8fe5a87d50.png)
[CMDBuild](http://www.cmdbuild.org/en) is a web environment in which you can configure custom solutions for IT Governance, or more generally for asset management.

## CMDBuild READY2USE 2.0
![reasy2use_logo](http://www.cmdbuild.org/++resource++tecnoteca.cmdbuildtheme2011.readytousepromo.img/logo_r2u.png)
Pre-configured CMDBuild READY TO BE USED within the production environment

## CMDBuild openMAINT 2.0
![openmaint_logo](http://www.openmaint.org/images/logostandardsmall.png)
Open source solution for the Property & Facility Management; an application for the management of buildings, installations, movable assets and related maintenance activities

### Information
**04/08/2019** Add READY2USE 2.0 and openMAINT 2.0  
**12/07/2019** Add CMDBuild 3.1 with old version READY2USE (but we still waiting 2.0)

This is the unofficial repository with all the versions of cmdbuild.  
I will update the repository every time there is a new version of cmdbuild available

*Sometimes container cmdbuild_app after first run may be stopped, because it need more memory for this. Please, restart it*  

**Please open issues on [github](https://github.com/itmicus/cmdbuild_docker/issues)**  

### Deploy by docker run
**CMDbuild with demo database**  
```bash
docker run --name cmdbuild_db -p 5432:5432 -d itmicus/cmdbuild:db-3.0
docker run --name cmdbuild_app --restart unless-stopped --link cmdbuild_db  -p 8090:8080 -d itmicus/cmdbuild:app-3.1
```

**CMDbuild READY2USE 2.0**  
```bash
docker run --name cmdbuild_db -p 5432:5432 -d itmicus/cmdbuild:db-3.0
docker run --name cmdbuild_app --restart unless-stopped -e CMDBUILD_DUMP="ready2use_demo.dump.xz" --link cmdbuild_db  -p 8090:8080 -d itmicus/cmdbuild:r2u-2.0
```
  
**CMDbuild openMAINT 2.0**  
```bash
docker run --name cmdbuild_db -p 5432:5432 -d itmicus/cmdbuild:db-3.0
docker run --name cmdbuild_app --restart unless-stopped -e CMDBUILD_DUMP="openmaint_demo.dump.xz" --link cmdbuild_db  -p 8090:8080 -d itmicus/cmdbuild:r2u-2.0
```
    
### Deploy by docker-compose
**CMDbuild with demo database**  
```bash
git clone https://github.com/itmicus/cmdbuild_docker
```  
cd to folder version 3.1 or ready2use 2.0 and run
```bash  
docker-compose up -d
```
  
**CMDbuild Ready2use**  
```bash  
git clone https://github.com/itmicus/cmdbuild_docker
```  
Open file docker-compose.yml and change to CMDBUILD_DUMP=ready2use_demo.dump.xz and save file
```bash
docker-compose up -d
```

**CMDbuild openMAINT 2.0**  
```bash  
git clone https://github.com/itmicus/cmdbuild_docker
```  
Open file docker-compose.yml and change to CMDBUILD_DUMP=openmaint_demo.dump.xz and save file
```bash
docker-compose up -d
```


### Connect to CMDBuild
Waiting while all container starting and initilize database (about few minutes) and open your browser  
http://localhost:8090/cmdbuild  
Login: admin  
Password: admin  
  
    
### How it works

#### Tomcat
http://localhost:8090/  
Login: admin  
Password: password  

#### The default cmdbuild_app environment in the image is:  

POSTGRES_USER: postgres  
POSTGRES_PASS: postgres  
POSTGRES_PORT: 5432  
POSTGRES_HOST: cmdbuild_db  
POSTGRES_DB: cmdbuild_db3  
CMDBUILD_DUMP: demo  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz
* openmaint_demo.dump.xz
* openmaint_empty.dump.xz
* openmaint_empty_gis.dump.xz
* ready2use.dump.xz
* ready2use_demo.dump.xz
* ready2use_empty.dump.xz

#### CMDBUILD users
* admin/admin       - full admin
* demouser/demouser - multi-groups
* guest/guest       - readonly

#### How drop cmdbuild database
If you want to change type DB you must drop old database
```bash
docker-compose exec cmdbuild_app /usr/local/tomcat/webapps/cmdbuild/cmdbuild.sh dbconfig drop -configfile /usr/local/tomcat/conf/cmdbuild/database.conf
```
and after run container with new value of CMDBUILD_DUMP




