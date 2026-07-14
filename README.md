# CMDBuild 4.2.0 with READY2USE 2.4 and openMAINT 2.4 in Docker

![cmdbuild_logo](https://www.tecnoteca.com/immagini/logo_cmdbuild.png/@@images/bf2e13f9-7a90-4e41-ba76-cf8fe5a87d50.png)

[CMDBuild](http://www.cmdbuild.org/en) is a web environment for configuring custom solutions for IT Governance and asset management.

[READY2USE](http://www.cmdbuild.org/en/prodotti/ready2use) — pre-configured CMDBuild, ready to be used in production.

[openMaint](http://www.openmaint.org) — open source solution for Property & Facility Management; an application for managing buildings, installations, movable assets, and related maintenance activities.

---

## Latest News

| Date | Updates |
|------|---------|
| **13/07/2026** | Add to CMDBuild 4.2.0 configure attachments to postgres. |
| **08/07/2026** | Add CMDBuild 4.2.0 — @itmicus. Minimum Docker Compose version v2.34.0. Added PGAdmin for managing CMDBuild DB. |
| **21/10/2025** | Add CMDBuild 4.1.0, READY2USE 2.4 (on CMDBuild 4.1.0), openMAINT 2.4 (on CMDBuild 4.1.0). Refactoring, up to PostgreSQL 17 / Tomcat 11 — @itmicus. |
| **21/10/2025** | Add CMDBuild 4.0.0, READY2USE 2.4 (on CMDBuild 4.0.4), openMAINT 2.4 (on CMDBuild 4.0.4). Refactoring, up to PostgreSQL 17 / Tomcat 11 — @itmicus. |
| **06/08/2023** | Add CMDBuild 3.4.2, READY2USE 2.3 (on CMDBuild 3.4.1) — @itmicus. |
| **21/02/2023** | Add CMDBuild 3.4, CMDBuild 3.4.1, and openMAINT 3.2 (on CMDBuild 3.4.1) — @afcarvalho1991 and @quinont contribution. |
| **29/12/2020** | Add openMAINT 2.1 on CMDBuild 3.3b — @afcarvalho1991 contribution. |
| **12/10/2020** | Add CMDBuild 3.3, READY2USE 2.0 and openMAINT 2.0 on CMDBuild 3.2.1 — @afcarvalho1991 contribution. |
| **11/06/2020** | Add CMDBuild 3.2.1, READY2USE 2.0 and openMAINT 2.0 on CMDBuild 3.2.1. |
| **19/02/2020** | Add CMDBuild 3.2, READY2USE 2.0 and openMAINT 2.0 on CMDBuild 3.2. |
| **27/10/2019** | Add CMDBuild 3.1.1, READY2USE 2.0 and openMAINT 2.0 on CMDBuild 3.1.1. |
| **04/08/2019** | Add READY2USE 2.0 and openMAINT 2.0. |
| **12/07/2019** | Add CMDBuild 3.1 with old version READY2USE (still waiting 2.0). |

---

This is the **unofficial** repository with all versions of CMDBuild.
I will update the repository every time a new version of CMDBuild is available.

> [!NOTE]
> Sometimes the `cmdbuild_app` container may stop after the first run because it needs more memory. Please restart it.

**Please open issues on [GitHub](https://github.com/itmicus/cmdbuild_docker/issues).**

---

## Deploy by `docker run`

### Build Images (Locally)

```bash
sh docker-build.sh
# or select the specific version needed and the DB image
```

---

## Deploy by `docker compose`

### CMDBuild with Demo Database

```bash
git clone https://github.com/itmicus/cmdbuild_docker
docker-compose -f cmdbuild-4.2.0/docker-compose.yml up -d --wait
# configure attachments
docker exec -ti cmdbuild_app /usr/local/tomcat/webapps/cmdbuild/cmdbuild.sh restws setconfig org.cmdbuild.dms.enabled false
docker exec -ti cmdbuild_app /usr/local/tomcat/webapps/cmdbuild/cmdbuild.sh restws setconfig org.cmdbuild.dms.service.type postgres
docker exec -ti cmdbuild_app /usr/local/tomcat/webapps/cmdbuild/cmdbuild.sh restws setconfig org.cmdbuild.dms.enabled true
```

### CMDBuild Ready2Use 2.4-4.1.0

```bash
git clone https://github.com/itmicus/cmdbuild_docker
```

Open `docker-compose.yml`, change `CMDBUILD_DUMP` to `demo.dump.xz`, and save the file.

```bash
docker-compose -f ready2use-2.4-4.1.0/docker-compose.yml up -d
```

### CMDBuild openMAINT 2.4-4.1.0

```bash
git clone https://github.com/itmicus/cmdbuild_docker
```

Open `docker-compose.yml`, change `CMDBUILD_DUMP` to `demo.dump.xz`, and save the file.

```bash
docker-compose -f openmaint-2.4-4.1.0/docker-compose.yml up -d
```

---

## Connect to CMDBuild

Wait for all containers to start and initialize the database (a few minutes), then open your browser:

| Service      | URL                                    | Login | Password |
|--------------|----------------------------------------|-------|----------|
| **CMDBuild** | http://localhost:8090/cmdbuild         | admin | admin    |
| **Tomcat**   | http://localhost:8090/manager/                 | admin | password |
| **PGAdmin**   | http://localhost:5050/                | admin@example.com | admin


---

## How It Works

### Default `cmdbuild_app` Environment Variables

| Variable          | Value           |
|-------------------|-----------------|
| `POSTGRES_USER`   | `postgres`      |
| `POSTGRES_PASS`   | `postgres`      |
| `POSTGRES_PORT`   | `5432`          |
| `POSTGRES_HOST`   | `cmdbuild_db`   |
| `POSTGRES_DB`     | `cmdbuild_db4`  |
| `CMDBUILD_DUMP`   | `demo.dump.xz`  |

### `CMDBUILD_DUMP` Values for Ready2Use and openMAINT

- `demo.dump.xz`
- `empty.dump.xz`

### CMDBuild Users

| Username   | Password   | Role          |
|------------|------------|---------------|
| `admin`    | `admin`    | Full admin    |
| `demouser` | `demouser` | Multi-groups  |
| `guest`    | `guest`    | Read-only     |

---

### How to Drop the CMDBuild Database

If you want to change the database type, you must drop the old database first:

```bash
docker-compose exec cmdbuild_app /usr/local/tomcat/webapps/cmdbuild/cmdbuild.sh dbconfig drop -configfile /usr/local/tomcat/conf/cmdbuild/database.conf
```

Then run the container with a new value for `CMDBUILD_DUMP`.
