#!/bin/bash
sleep 60
cd /usr/src/app
node seeds/seed.js
node app.js
