# AWS-SpringBoot-K8S

## Docker commands

### Build and run image

```
> docker build -t ms-employee-img .

> docker images

> docker run -p 8088:8088 ms-employee-img --name ms-employee ms-employee-img

> docker ps -a 

```

### Images

```
> docker build -t ms-employee-img .

> docker run -p 8088:8088 ms-employee-img --name ms-employee ms-employee-img

> docker rmi <IMAGE_ID>

> docker image prune

> docker image inspect <IMAGE_ID>

> docker images
```

### Containers

```
> docker ps 

> docker ps -a

> docker start <CONTAINER_ID>

> docker logs <CONTAINER_ID>

> docker rm <CONTAINER_ID>

> docker container prune

> docker container inspect <CONTAINER_ID>
```

### Network

```
> docker network --help

> docker network ls

> docker network create my_network
```

### Volumes

```
> docker volume ls
```

## Dockerfile to create image

```
FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY ./target/aws-spring-k8s-0.0.1-SNAPSHOT.jar .

EXPOSE 8088

CMD ["java", "-jar", "aws-spring-k8s-0.0.1-SNAPSHOT.jar"]
```

> docker build -t ms-employee-img .

