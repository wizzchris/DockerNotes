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

## **Ansible and Docker**

Ansible can be used to create containers. This means we can make them even more portable. This is because we can then reproduce it in vagrant cloud or on docker.
We can do this with ansible container
This will allow us to describe the application in a single YAML file rather than a Dockerfile.

When installing ansible container we need to rely upon supported container engines for building and running the project
