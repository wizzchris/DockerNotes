#!/bin/bash
metricbeat modules enable system
filebeat modules enable system
systemctl start metricbeat
systemctl start filebeat
sleep 60
cd /usr/src/app
node seeds/seed.js
node app.js
