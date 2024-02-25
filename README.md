## 1. Introduction

The repository contains the backend service code for the WeChat ordering mini-program "miniOrder". Technologies and tools used include:

- SpringBoot
- Maven
- Redis
- MySQL
- Docker



## 2. Deployment Steps

>Database Installation and Setup

1. Use `Docker` to pull and install the `MySQL` container.

```shell
# create folder for mounting
mkdir ~/mysql && cd ~/mysql

# pull mysql image
docker pull mysql:5.7

# create and run mysql container
docker run -id \
	-p 3306:3306 \ 
	-v $PWD/conf:/etc/mysql/conf.d \
	-v $PWD/logs:/logs \
	-v $PWD/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=123456 \
	--name mysql \
	mysql:5.7
```

2. Executing the `mini_order.sql` file will automatically create the data tables needed for the project.

```shell
# clone the code to the current user folder
cd ~ && git clone https://github.com/dop2001/MiniOrder-Backend.git

# copy the sql file to the root directory of the mysql container
docker cp MiniOrder-Backend/mini_order.sql mysql:/

# enter the mysql container
docker exec -it mysql /bin/bash

# login mysql
mysql -u root -p123456

# run sql file
source mini_order.sql
```

> Run code

1. If you need to re-develop the source code, please first download the `IDEA` compiler and import this project into it, and finally execute the `ServerApplication.java` file to run the project. **Note: Please set your database account and password in the `application.yaml` configuration file.**

2. You can also use the jar package to run directly.

```shell
# pull jdk17 image
docker pull openjdk:17-jdk-alpine

# --link enables the current container to access the mysql container
docker run -id \
	-p 8080:8080 \
	--link mysql \
	--name miniOrder \
	openjdk:17-jdk-alpine
	
# copy the jar package into the container
docker cp MiniOrder-Backend/miniOrder.jar miniOrder:/

# enter the container and run the jar package
docker exec -it miniOrder /bin/sh
java -jar miniOrder.jar
```

