#!/bin/bash

# re-create the dummy cert with the correct hostname
pushd /etc/pki/tls/certs/
rm localhost.crt
cat << EOF | make testcert
.
.
.
.
.
pulp-server.usersys.redhat.com
.
EOF
popd

exec httpd -D FOREGROUND
