#!/bin/bash
metricbeat modules enable system
filebeat modules enable system
filebeat modules enable nginx
service metricbeat start
service filebeat start
sleep 60
cd /usr/src/app
node seeds/seed.js
node app.js
