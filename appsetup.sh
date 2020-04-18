#!/bin/bash
sudo metricbeat modules enable system
sudo filebeat modules enable system
sudo systemctl start metricbeat
sudo systemctl start filebeat
sleep 60
cd /usr/src/app
node seeds/seed.js
node app.js
