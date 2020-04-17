#!/bin/bash
sleep 90
cat /usr/src/nginx/nginxconf.conf > /etc/nginx/nginx.conf
nginx -s reload
