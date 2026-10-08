#!/bin/sh
# The login form tells a wrong password for an existing user (admin) apart from an unknown
# user, and the uploads folder is browsable.
set -e
curl -sS -H 'Host: localhost:8000' --data 'log=admin&pwd=not-the-password&wp-submit=Log+In' http://wordpress/wp-login.php | grep -q 'for the username <strong>admin</strong> is incorrect'
curl -fsS -H 'Host: localhost:8000' http://wordpress/wp-content/uploads/ | grep -q 'Index of /wp-content/uploads'
