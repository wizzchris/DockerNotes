#!/bin/bash
metricbeat modules enable system
filebeat modules enable system
filebeat modules enable nginx
service metricbeat start
service filebeat start

sleep 20
echo "Starting replica set initialize"
until mongo --host mongodb://db --eval "print(\"waited for connection\")"
do
    sleep 1
done
mongo mongodb://db <<EOF
var cfg = {
    "_id": "rs0",
    "version": 1,
    "members": [
        {
            "_id": 0,
            "host": "db:27017",
            "priority": 2
        },
        {
            "_id": 1,
            "host": "db1:27017",
            "priority": 0
        },
        {
            "_id": 2,
            "host": "db2:27017",
            "priority": 0
        }
    ],settings: {chainingAllowed: true}
};
rs.initiate(cfg, { force: true });
rs.reconfig(cfg, { force: true });
rs.slaveOk();
db.getMongo().setReadPref('nearest');
db.getMongo().setSlaveOk();
EOF
