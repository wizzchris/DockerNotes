# Docker Notes
## **Introduction**
This document is to help me in the future run docker containers.

Docker is similar to VMs. VMs produce an instance of a distinct computer system with an operating system and requires either entire virtualisation or hardware assisted virtualisation. Containers are similar in that they can be customised and built to whatever specification is desired. However a guest operating system is not installed and usually consists only the application code and when run only does the necessary processes.  

The containers operate on the host OS, they are stored as images so are much smaller and more portable to use.

## **Installation**

To install docker on an ubuntu server run these commands:
````
sudo apt-get update
sudo apt-get upgrade
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io
````

## **Method**
First run the command
````
docker --version
````
To check you have docker installed then run the command
````
docker run hello-world
````
To check docker is working correctly

The setup works as followed:
1. Create and test individual containers for each component of your application by first creating Docker images.
2. Assemble your containers and supporting infrastructure into a complete application.
3. Test, share, and deploy your complete containerised application.

#### **Write**

To build an image first start with a dockerfile. This is used to build the image. The components of the dockerfile are:
````
FROM
WORKDIR
COPY
RUN
CMD
EXPOSE
````
From selects the original image to build from. Workdir specifies where the actions should be taken from in the images filesystem. Copy will copy a host file to the images file. Run will run the commands inside the images filesystem. Cmd directive is specifying the metadata. Finally expose informs docker that the container is listening on that port.  
Follow this link for more directives:
````
https://docs.docker.com/engine/reference/builder/
````
#### **Build**

Once the docker file is created you run the command
````
docker build
````
You can add the flag --tag to tag the image

#### **Run**

After this run the command
````
docker run
````
You can add flags to specify certain variables. This can include:
- --publish which asks what port on the host machine to link with the containers port
- --detach asks docker to run the container in the background
- --name specifies the name with which to refer the container

You can remove the container with the command
````
docker rm --force
````

## **Docker Compose**
Docker compose allows us to run multiple containers at once. It also allows us to run further commands.
To create a docker compose, make a file called docker-compose.yml and start with the version of docker you want the containers to be run with.
You then add services. From here you specify the conatiners names and the images. The docker compose I have made is
````
version: "3.7"
services:

  lb:
    build:
      context: ./
      dockerfile: lbdockerfile
    container_name: lb
    restart: always
    ports:
      - "80:80"
    depends_on:
      - db
      - db1
      - db2
      - app
      - app1
      - app2

  app:
    image: dockernotes_app
    container_name: app
    restart: always
    environment:
      DB_HOST: mongodb://db:27017,db1:27017,db2:27017/posts?replicaSet=rs0
    depends_on:
      - db
      - db1
      - db2

  app1:
    image: dockernotes_app
    container_name: app1
    restart: always
    environment:
      DB_HOST: mongodb://db:27017,db1:27017,db2:27017/posts?replicaSet=rs0
    depends_on:
      - db
      - db1
      - db2

  app2:
    image: dockernotes_app
    container_name: app2
    restart: always
    environment:
      DB_HOST: mongodb://db:27017,db1:27017,db2:27017/posts?replicaSet=rs0
    depends_on:
      - db
      - db1
      - db2

  db_init:
    image: dockernotes_db
    container_name: db_init
    command: ./setup.sh
    depends_on:
      - db
      - db1
      - db2

  db:
    image: mongo
    container_name: db
    restart: always
    command: mongod --bind_ip_all --replSet rs0

  db1:
    image: mongo
    container_name: db1
    restart: always
    command: mongod --bind_ip_all --replSet rs0

  db2:
    image: mongo
    container_name: db2
    restart: always
    command: mongod --bind_ip_all --replSet rs0
````
Many of the commands are self explanatory. For more choices follow the link
````
https://docs.docker.com/compose/compose-file/#entrypoint
````
