### Deploy by docker run
**openMAINT with demo database**  
```bash
docker run --name openmaint_db -p 5432:5432 -d itmicus/cmdbuild:db-3.0
docker run --name openmaint_app --restart unless-stopped -e CMDBUILD_DUMP="demo.dump.xz" --link openmaint_db  -p 8090:8080 -d itmicus/cmdbuild:om-2.0-3.2.1
```  

#### CMDBUILD_DUMP values
* demo.dump.xz
* empty.dump.xz