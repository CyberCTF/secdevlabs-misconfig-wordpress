# The wordpress service of upstream's deployments/docker-compose.yml: secDevLabs' published image
# secdevlabs/a6-the-mistery:wp-version-2 (WordPress 4.9.5 on PHP 7.2.5 with a browsable uploads
# folder), pinned by digest. The repository has no Dockerfile for it. Its environment
# (WORDPRESS_DB_HOST=db:3306, user and password wordpress) is already in the image.
# Added here: setup-site.sh, started in the background before the image's own entrypoint and
# command (docker-entrypoint.sh apache2-foreground, which copies WordPress in), which runs WordPress's
# installer once so the site is in the state the app's README describes (site SECWEB, user
# admin, password `password`); upstream ships no database content, so a fresh start shows the
# installer instead.
FROM docker.io/secdevlabs/a6-the-mistery@sha256:b9c9c528da5461003d6e6cbce93040fd54fc8ed8000829c5289805c65eb51cdd
COPY setup-site.sh /usr/local/bin/setup-site
ENTRYPOINT ["sh", "-c", "sh /usr/local/bin/setup-site & exec docker-entrypoint.sh \"$@\"", "--"]
CMD ["apache2-foreground"]
