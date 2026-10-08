# secDevLabs Vulnerable WordPress Misconfig

[secDevLabs](https://github.com/globocom/secDevLabs)' [`owasp-top10-2021-apps/a5/misconfig-wordpress`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a5/misconfig-wordpress) app, by Globo.com and the
secDevLabs contributors: an outdated WordPress (4.9.5 on PHP 7.2.5) with several Security Misconfigurations: verbose login errors, a weak admin password, a browsable uploads folder and revealing headers. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, built from
the vendored app folder (see [UPSTREAM.md](UPSTREAM.md)).

| Machine | Service |
| --- | --- |
| wordpress | WordPress 4.9.5 on port 80, published on 8000 |
| db | MariaDB 10.6.3 on port 3306 (lab network only) |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:8000/ (the site's links point there). The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: the app's
[README](https://github.com/globocom/secDevLabs/blob/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a5/misconfig-wordpress/README.md), with the attack narrative and the secDevLabs walkthrough.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as secDevLabs ([LICENSE](LICENSE)). The third-party software inside the images keeps
its own licence. This application is deliberately vulnerable: keep it isolated.
