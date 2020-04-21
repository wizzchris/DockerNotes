docker build -t dockernotes_elst -f elasticdockerfile .
docker build -t dockernotes_app -f appdockerfile .
docker build -t dockernotes_db -f dbdockerfile .
docker build -t dockernotes_kibana -f kibanadockerfile .
docker build -t dockernotes_log -f logstashdockerfile .
docker-compose down
docker-compose up
