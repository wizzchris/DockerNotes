#!/bin/bash
sleep 150
cat /usr/src/nginx/nginxconf.conf > /etc/nginx/nginx.conf
systemctl restart nginx
