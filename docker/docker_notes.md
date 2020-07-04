# Docker Notes
## What is it?
Docker is a set of platform as a service (PaaS) products that uses OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels.

### Docker Engine 
The software that hosts the containers is called Docker Engine. 

### Image and Container
From object oriented perspective we can consider image and class and container as an instance of it.

You might ask, how a container provides the required environment with isolation if it shares the OS kernel. Well, that is done with the help of images.

Let’s take an example here. If your app only needs Python 3.5 from the system, you will only need that in your production environment as a dependency. Everything else will be an extra overhead. So, Docker provides the template built on the Linux kernel with the needed dependencies only and nothing is installed in that template. That template is called an image.

## How Docker is so useful
- Consistent and uniform dev/test environment
- Cross plateform packages
- Runtime scalable 
- Identification and encapsulation of dependencies 
- Reusable images

## 
## How to run Docker then ?
### Well, install it first
Need help? follow me -> [Installation Guide](docker_installation.md) 

## Run a container for Hello-World image 
Identify and test hello-world image available on hub.docker.com. 
> docker run -it hello-world

Generally image name is followed by tag but one can skip it if it is latest, that means above code can be written as 
> docker run -it hello-world:latest

for other examples  
> docker run -it ubuntu:v1

Here -i means interative, -t means terminal, ubuntu is image name , v1 is tag

In practice it checks if image is available on local machine if not, it pulls the image from docker hub and runs the container. i.e. it runs 

### What are other container options
Get detail using 
> docker container --help

but few of those very handy to use are here, provide __container_id__ which can be noted from _docker ps_ command. 
- attach : Attach local standard input, output, and error streams to a running container
- commit : Create a new image from a container's changes
- diff : Inspect changes to files or directories on a container's filesystem
- exec : Run a command in a running container
- inspect : Display detailed information on one or more containers
- kill : Kill one or more running containers
- logs : Fetch the logs of a container
- rename : Rename a container
- rm : Remove one or more containers
- run : Run a command in a new container
- start : Start one or more stopped containers
- stats : Display a live stream of container(s) resource usage statistics
- stop : Stop one or more running containers
- top : Display the running processes of a container

### How to come out of container 
__Ctrl + P__, __Ctrl + q__ to come out of container without killing the container, __Ctrl + d__ to exit

### Check running containers 
```
docker ps 
docker ps -a //for history
```
one can achieve same this using 
```
docker container ls 
docker container ls -a //for history
```

## What about images? how to check image lists
> docker images

Other image options
- build       Build an image from a Dockerfile
- inspect     Display detailed information on one or more load        Load an image from a tar archive or STDIN
- ls          List images
- prune       Remove unused images
- pull        Pull an image or a repository from a registry
- push        Push an image or a repository to a registry
- rm          Remove one or more images
- save        Save one or more images to a tar archive (streamed to STDOUT by default)
- tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE

## Few use cases
### Show me the images  
> docker 
### What's in the name, Huge!! Rename it please.
Change name,tag or both
```
docker tag hw:latest hw:v1//give new name
docker tag hw:latest hello:v2
```
### Yuck, don't like this image, Remove it. 
> docker rmi image_name:tag //cam use image id as well

> docker rmi <image_id> // use -f for force delete 

but you can not remove if a container of this image is running, sometime not as it can not be as it can be attached

If you see many untagged images and you need to clean up, run 
> docker image prune 

### Hey, I want to share my docker image to my friend! 
1. Save image to tar fil my hare, other guy need to load it see the image in images list(seen using `docker images`)
```
docker save <image_name> -o taranme
docker load -i <taranme>
```

2. Upload it to registry
- Rename image to docker_username/imagename:tag using
    > docker tag <imageid> sunilrpandey(username at docker)/ubuntuvim:V1
- Log in to hub.docker.com
- Push image to docker hub 

    ` docker push docker_username/imagename:tag `
- Run container on the image to verify
    
    ` docker run -it docker_username/imagename:tag `

    Generally in org level docker registry, it should be like
    ```
    docker push image_name
    where image_name should be similar to registry.org.com/<user_name>/<image_name>:tag to make it unique
    ```

### Cand I copy file from host machine to container's file system? why not!!
> docker cp  files_dirs_to_copy container_name:/bin/path

### I have done so much after running container, Wish I container like this when I ran container. 
### Get image from the running container 
> docker commit <cont_name>  // will change container into image // imageplusexe, if you copy exe in container

### Run existing container and get result from host machine
> docker exec -it container_name  bash 

for example can give ps in container and show output on host  

### Open multiple executables on multiple termial, need multiples terminals to execute in container
Can be done in two steps
- Get image running on container in the background (-d works here for this)   
    > docker run -d -it <image_id>
- Note down the container id using      
    `docker ps` 
    
    and run below command to run from multiple terminals, which in turn will open multiple containers to run executables
    
    ` docker exec -it <container_id> bash` 
    
## Create Docker image from existing image(Dockerfile)
### Get Base image
Go to docker hub and search base image with appropriate tag on which you would like put layer of your image
for example, for me I chose dashing tag of ros image. Now use below Keys to create your own Dockerfile and build it to have your own image.

Listing few here,rest to follow  
```
FROM <base_image> //e.g. FROM ros:dashing
COPY . /app       // copy files/dir in current dir to /app on docker filesystem
WORKDIR /app   //workign directory on container FS
CMD python hello.py  // run this command on container 
MAINTAINER
RUN   // to run a command e.g. sudo apt update/install etc
EXPOSE
ENV
ADD ~ COPY, copy is preferred  
```
### How Dockerfile is built to create image?
```
docker build . // will built but no image name or tag
docker build -t <image_name> . // build and give a name/tag
```
building dockerfile logs step wise status, Go through and make changes in Dockerfile if required.

## Misc
### Other docker run options
-p 8080:80 maps network service port 80 in the container to 8080 on our host system.

-v /full/path/to/html/directory:/usr/share/nginx/html:ro maps the directory holding our web page to the required location in the image. The ro field instructs Docker to mount it in read-only mode. It’s best to pass Docker the full paths when specifying host directories.

-d detaches the container from our command line session. Here we dont want container to be interative



