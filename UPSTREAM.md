# Upstream

| | |
| --- | --- |
| Project | secDevLabs (Globo.com) |
| Repository | https://github.com/globocom/secDevLabs |
| App | `owasp-top10-2021-apps/a5/misconfig-wordpress` |
| Version | master (secDevLabs has no releases) |
| Commit | 10be438496e928c66567749f0aaf0bb976052bc9 |
| Licence | BSD-3-Clause |

The app folder [`owasp-top10-2021-apps/a5/misconfig-wordpress`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a5/misconfig-wordpress) of that commit is vendored unchanged, without its Git history,
in `app/` (upstream runs a published image for the site, see below):

| Upstream path (in the app folder) | Here |
| --- | --- |
| everything (README, Makefile, deployments, images) | `app/` |

Each `build/<machine>/Dockerfile` says in its header comment how it differs from upstream:

- `build/wordpress/`: upstream runs secDevLabs' published image `secdevlabs/a6-the-mistery:wp-version-2`, which has no Dockerfile in the repository; the overlay pins it by digest (`sha256:b9c9c528...51cdd`) and adds `setup-site.sh`, which runs WordPress's installer once at first start so the site is in the state the app's README describes (site SECWEB, user `admin`, password `password`). Upstream ships no database content, so a fresh start of upstream's compose file shows the installer instead.
- `build/db/`: the `mariadb:10.6.3` service of upstream's compose file with its environment baked in.
- The site URL is `http://localhost:8000`, upstream's published port.

To update, replace the vendored folders with a newer secDevLabs commit, then change this file.
