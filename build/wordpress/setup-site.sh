#!/bin/sh
# Runs WordPress's installer once, as a visitor would on the first page: site SECWEB, user admin,
# password `password` (the state described in the app's README). The Host header makes the site
# URL http://localhost:8000, the port upstream publishes.
for i in $(seq 1 120); do
  page=$(curl -s -H 'Host: localhost:8000' http://127.0.0.1/wp-admin/install.php) && break
  sleep 2
done
case "$page" in
  *'name="weblog_title"'*)
    curl -s -o /dev/null -H 'Host: localhost:8000' \
      --data 'weblog_title=SECWEB&user_name=admin&admin_password=password&admin_password2=password&pw_weak=on&admin_email=admin%40secweb.local&blog_public=0&Submit=Install+WordPress&language=' \
      'http://127.0.0.1/wp-admin/install.php?step=2'
    echo "setup-site: WordPress installed (admin / password)"
    ;;
  *) echo "setup-site: WordPress already installed" ;;
esac
