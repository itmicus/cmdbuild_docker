### Deploy by docker run
**CMDbuild with demo database**  
```bash
docker compose up -d --wait
```  

**With pgAdmin (admin profile):**
```bash
docker compose up -d --wait
```

#### CMDBUILD_DUMP values
* `demo.dump.xz`
* `empty.dump.xz`
* `test.dump.xz`

#### Environment variables (.env)

| Variable | Default | Description |
|----------|---------|-------------|
| `POSTGRES_USER` | `postgres` | PostgreSQL superuser |
| `POSTGRES_PASSWORD` | `postgres` | PostgreSQL superuser password |
| `POSTGRES_PORT` | `5432` | PostgreSQL port |
| `POSTGRES_HOST` | `cmdbuild_db` | PostgreSQL hostname |
| `POSTGRES_DB` | `cmdbuild_4` | CMDBuild database name |
| `CMDBUILD_DB_USER` | `cmdbuild` | CMDBuild application database user |
| `CMDBUILD_DB_PASSWORD` | `cmdbuild` | CMDBuild application database password |
| `JAVA_OPTS` | `-Xmx6000m -Xms3000m` | JVM options for Tomcat |
| `PGADMIN_DEFAULT_EMAIL` | `admin@example.com` | pgAdmin login email |
| `PGADMIN_DEFAULT_PASSWORD` | `admin` | pgAdmin login password |

#### Please change credentials for postgres and tomcat server
* @ `cmdbuild-4.2.0/.env` — all environment variables
* @ `cmdbuild-4.2.0/files/context.xml`
* @ `cmdbuild-4.2.0/files/tomcat-users.xml`

#### Credentials and access to Cmdbuild
* **Link to CMDbuild app** — http://localhost:8090/cmdbuild/ui/
* **username** — admin (default)
* **password** — admin (default)

#### Credentials and access to Cmdbuild Database
* **Host** — cmdbuild_db:5432
* **username** — postgres (default)
* **password** — postgres (default)

#### Credentials and access to Tomcat
* **Link to Tomcat manager** — http://localhost:8090/manager
* **username** — admin
* **password** — password

#### Credentials and access to PGAdmin
* **Link to PGAdmin** — http://localhost:5050 (localhost only)
* **username** — admin@example.com
* **password** — admin
* **Note:** pgAdmin runs only with `--profile admin` flag. Master password is required on first login.