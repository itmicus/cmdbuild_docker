# CMDBuild 3.4.1 with READY2USE 2.0 and openMAINT 2.3 in Docker

![cmdbuild_logo](https://www.tecnoteca.com/immagini/logo_cmdbuild.png/@@images/bf2e13f9-7a90-4e41-ba76-cf8fe5a87d50.png)  
[CMDBuild](http://www.cmdbuild.org/en) is a web environment in which you can configure custom solutions for IT Governance, or more generally for asset management.  

[READY2USE](http://www.cmdbuild.org/en/prodotti/ready2use) pre-configured CMDBuild READY TO BE USED within the production environment  

[openMaint](http://www.openmaint.org) open source solution for the Property & Facility Management; an application for the management of buildings, installations, movable assets and related maintenance activities  

## Latest news

**21/02/2023** Add CMDBuild 3.4, CMDBuild 3.4.1, and openMAINT 3.2 (on CMDBuild 3.4.1) -- @afcarvalho1991 and @quinont contribution.  
**29/12/2020** Add openMAINT 2.1 on CMDBuild 3.3b  @afcarvalho1991 contribution  
**12/10/2020** Add CMDBuild 3.3, READY2USE 2.0 and openMAINT 2.0 on CMDBuild 3.2.1  @afcarvalho1991 contribution  
**11/06/2020** Add CMDBuild 3.2.1, READY2USE 2.0 and openMAINT 2.0 on CMDBuild 3.2.1  
**19/02/2020** Add CMDBuild 3.2, READY2USE 2.0 and openMAINT 2.0 on CMDBuild 3.2  
**27/10/2019** Add CMDBuild 3.1.1, READY2USE 2.0 and openMAINT 2.0 on CMDBuild 3.1.1  
**04/08/2019** Add READY2USE 2.0 and openMAINT 2.0  
**12/07/2019** Add CMDBuild 3.1 with old version READY2USE (but we still waiting 2.0)

This is the unofficial repository with all the versions of cmdbuild.  
I will update the repository every time there is a new version of cmdbuild available

*Sometimes container cmdbuild_app after first run may be stopped, because it need more memory for this. Please, restart it*  

**Please open issues on [github](https://github.com/itmicus/cmdbuild_docker/issues)**  

## Deploy by docker run

### CMDbuild with demo database

```bash
docker compose -d -f 3.4.1/docker-compose.yml up
```

### Build images (locally)

    sh docker-build.sh # or select the specific version needed and the DB image

### CMDbuild READY2USE 2.0

```bash
docker run --name cmdbuild_db -p 5432:5432 -d itmicus/cmdbuild:db-3.0
docker run --name cmdbuild_app --restart unless-stopped -e CMDBUILD_DUMP="demo.dump.xz" --link cmdbuild_db  -p 8090:8080 -d itmicus/cmdbuild:r2u-2.0-3.3
```
  
### CMDbuild openMAINT 2.3

```bash
docker compose -d -f openmaint-2.3-3.4.1-d/docker-compose.yml up
```

## Deploy by docker-compose

### CMDbuild with demo database

```bash
git clone https://github.com/itmicus/cmdbuild_docker
```  
cd to folder version 3.4.1 or ready2use 2.0 or openmaint 2.0 and run
```bash  
docker-compose up -d
```
  
### CMDbuild Ready2use

```bash  
git clone https://github.com/itmicus/cmdbuild_docker
```  
Open file docker-compose.yml and change to CMDBUILD_DUMP=demo.dump.xz and save file
```bash
docker-compose up -d
```

### CMDbuild openMAINT 2.0

```bash  
git clone https://github.com/itmicus/cmdbuild_docker
```  
Open file docker-compose.yml and change to CMDBUILD_DUMP=demo.dump.xz and save file
```bash
docker-compose up -d
```

### CMDbuild openMAINT 2.3-3.4.1-d

```bash  
git clone https://github.com/itmicus/cmdbuild_docker
```  
Open file docker-compose.yml and change to CMDBUILD_DUMP=demo.dump.xz and save file
```bash
docker-compose -f openmaint-2.3-3.4.1-d/docker-compose.yml up
```

## Connect to CMDBuild

Waiting while all container starting and initilize database (about few minutes) and open your browser  
http://localhost:8090/cmdbuild  
Login: admin  
Password: admin  
  
    
## How it works

### Tomcat

http://localhost:8090/  
Login: admin  
Password: password  

### The default cmdbuild_app environment in the image is  

POSTGRES_USER: postgres  
POSTGRES_PASS: postgres  
POSTGRES_PORT: 5432  
POSTGRES_HOST: cmdbuild_db  
POSTGRES_DB: cmdbuild_db3  
CMDBUILD_DUMP: demo  

### CMDBUILD_DUMP values for Ready2use and openMAINT

* demo.dump.xz
* empty.dump.xz

### CMDBUILD users

* admin/admin       - full admin
* demouser/demouser - multi-groups
* guest/guest       - readonly

### How drop cmdbuild database
If you want to change type DB you must drop old database

```bash
docker-compose exec cmdbuild_app /usr/local/tomcat/webapps/cmdbuild/cmdbuild.sh dbconfig drop -configfile /usr/local/tomcat/conf/cmdbuild/database.conf
```

and after run container with new value of CMDBUILD_DUMP
