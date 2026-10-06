#!/bin/bash
set -e
# httpd already uses port 80 on this instance, so nginx listens on 8080
sed -i -E 's/(listen[[:space:]]+(\[::\]:)?)80;/\18080;/' /etc/nginx/nginx.conf
nginx -t
systemctl enable nginx || true
systemctl start nginx || service nginx start
