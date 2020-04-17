# README for Docker
In this repository I write notes for docker and try it out with the app and db repositories I have used before.
To use this repository ensure docker is installed and run the command:
````
docker-compose up
````
This should create a load balanced application with a mongodb replica set as the database. It will also have monitoring in the form of ELK stack.
### **Files**
Here we describe the files in the repository:
- appdockerfile = Dockerfile for the app image
- appsetup.sh = it is the script to be run on the app nodes to connect them
- dbdockerfile = Dockerfile for the db image
- Docker-compose.yml = Script for the docker and what containers to run
- Docker.md = notes for docker
- lbdockerfile = Dockerfile for the load balancer
- setup.sh = script to be run for the databases to create the replica set
