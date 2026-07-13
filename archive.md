# Archived Versions

Оlder Docker image builds for CMDBuild, Ready2Use, and openMAINT.

---

## CMDBuild Application Images

| Command | Tag | Source | Maintainer |
|---------|-----|--------|------------|
| `docker build` | `itmicus/cmdbuild:4.0.0` | `cmdbuild-4.0.0/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:app-3.4.4` | `3.4.4/cmdbuild/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:app-3.4.2` | `3.4.2/cmdbuild/.` | Itmicus <order@itmicus.com> |
| `docker build` | `afcarvalho1991/cmdbuild:app-3.4.1` | `3.4.1/cmdbuild/.` | Andre Carvalho <afccarvalho.1991@gmail.com> |
| `docker build` | `afcarvalho1991/cmdbuild:app-3.4` | `3.4/cmdbuild/.` | Andre Carvalho <afccarvalho.1991@gmail.com> |
| `docker build` | `itmicus/cmdbuild:app-3.3` | `3.3/cmdbuild/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:app-3.2.1` | `3.2.1/cmdbuild/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:app-3.2` | `3.2/cmdbuild/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:app-3.1.1` | `3.1.1/cmdbuild/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:app-3.1` | `3.1/cmdbuild/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:db-3.0` | `3.0/postgres/.` | Itmicus <order@itmicus.com> |

---

## Ready2Use (r2u) Images

| Command | Tag | Source | Maintainer |
|---------|-----|--------|------------|
| `docker build` | `itmicus/cmdbuild:r2u-2.4-4.0.4` | `ready2use-2.4-4.0.4/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:r2u-2.3-3.4.1-d` | `ready2use-2.3-3.4.1-d/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:r2u-2.0-3.3` | `archive/ready2use-2.0-3.3/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:r2u-2.0-3.2.1` | `archive/ready2use-2.0-3.2.1/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:r2u-2.0-3.2` | `archive/ready2use-2.0-3.2/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:r2u-2.0-3.1.1` | `archive/ready2use-2.0-3.1.1/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:r2u-2.0` | `archive/ready2use-2.0/.` | Itmicus <order@itmicus.com> |

---

## openMAINT (om) Images

| Command | Tag | Source | Maintainer |
|---------|-----|--------|------------|
| `docker build` | `itmicus/cmdbuild:om-2.4-4.0.4` | `openmaint-2.4-4.0.4/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:om-2.3-3.4.1-d` | `openmaint-2.3-3.4.1-d/.` | Andre Carvalho <afccarvalho.1991@gmail.com> |
| `docker build` | `itmicus/cmdbuild:om-2.0-3.3` | `openmaint-2.0-3.3/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:om-2.0-3.2.1` | `openmaint-2.0-3.2.1/.` | Itmicus <order@itmicus.com> |
| `docker build` | `itmicus/cmdbuild:om-2.0-3.2` | `openmaint-2.0-3.2/.` | Itmicus <order@itmicus.com> |
| `docker build` | `afcarvalho1991/cmdbuild:om-2.1-3.3-b` | `openmaint-2.1-3.3-b/.` | Andre Carvalho <afccarvalho.1991@gmail.com> |
| `docker build` | `afcarvalho1991/cmdbuild:om-2.3-3.4.1-d` | `openmaint-2.3-3.4.1-d/.` | Andre Carvalho <afccarvalho.1991@gmail.com> |

---

## Original Build Commands

For reference, here are the original Docker build commands:

### CMDBuild

```bash
docker build -t itmicus/cmdbuild:4.0.0 cmdbuild-4.0.0/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:app-3.4.4 3.4.4/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:app-3.4.2 3.4.2/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t afcarvalho1991/cmdbuild:app-3.4.1 3.4.1/cmdbuild/. --label "version=1.0" --label "maintaner=Andre Carvalho <afccarvalho.1991@gmail.com>"
docker build -t afcarvalho1991/cmdbuild:app-3.4 3.4/cmdbuild/. --label "version=1.0" --label "maintaner=Andre Carvalho <afccarvalho.1991@gmail.com>"
docker build -t itmicus/cmdbuild:app-3.3 3.3/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:app-3.2.1 3.2.1/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:app-3.2 3.2/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:app-3.1.1 3.1.1/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:app-3.1 3.1/cmdbuild/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:db-3.0 3.0/postgres/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
```

### Ready2Use

```bash
docker build -t itmicus/cmdbuild:r2u-2.4-4.0.4 ready2use-2.4-4.0.4/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:r2u-2.3-3.4.1-d ready2use-2.3-3.4.1-d/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:r2u-2.0-3.3 archive/ready2use-2.0-3.3/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:r2u-2.0-3.2.1 archive/ready2use-2.0-3.2.1/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:r2u-2.0-3.2 archive/ready2use-2.0-3.2/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:r2u-2.0-3.1.1 archive/ready2use-2.0-3.1.1/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:r2u-2.0 archive/ready2use-2.0/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
```

### openMAINT

```bash
docker build -t itmicus/cmdbuild:om-2.4-4.0.4 openmaint-2.4-4.0.4/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:om-2.3-3.4.1-d openmaint-2.3-3.4.1-d/. --label "version=1.0" --label "maintaner=Andre Carvalho <afccarvalho.1991@gmail.com>"
docker build -t itmicus/cmdbuild:om-2.0-3.3 openmaint-2.0-3.3/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:om-2.0-3.2.1 openmaint-2.0-3.2.1/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t itmicus/cmdbuild:om-2.0-3.2 openmaint-2.0-3.2/. --label "version=1.0" --label "maintaner=Itmicus <order@itmicus.com>"
docker build -t afcarvalho1991/cmdbuild:om-2.1-3.3-b openmaint-2.1-3.3-b/. --label "version=1.0" --label "maintaner=Andre Carvalho <afccarvalho.1991@gmail.com>"
docker build -t afcarvalho1991/cmdbuild:om-2.3-3.4.1-d openmaint-2.3-3.4.1-d/. --label "version=1.0" --label "maintaner=Andre Carvalho <afccarvalho.1991@gmail.com>"