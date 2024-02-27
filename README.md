## Introduction

The repository contains the backend service code for the WeChat ordering mini-program "miniOrder". Technologies and tools used include:

- SpringBoot
- Maven
- Redis
- MySQL
- Docker



## Deployment Steps

>Run via jar package (Linux)

1. Install `docker` and `docker-compose`.

   ```shell
   # update package index
   sudo apt update
   
   # install necessary dependent software
   sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
   
   # import the GPG key of the source repository
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   
   # add the Docker APT software source to the system
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   
   # install the latest version of Docker
   sudo apt update
   sudo apt install docker-ce docker-ce-cli containerd.io
   ```

2. Run the `docker-compose.yml` file to automatically build the required containers.

   ```shell
   # create an empty folder to save project files
   mkdir project && cd project
   git clone https://github.com/dop2001/MiniOrder-Backend.git
   
   # run
   docker-compose up -d
   ```

3. Create a data table in the database.

   ```shell
   # enter the mysql container
   docker exec -it mysql /bin/bash
   
   # execute sql file
   mysql -u root -p123456 < mini_order.sql
   ```

   

> Run from source code (Linux & Win)

1. The system needs to install `Mysql` and `JDK 17` environments in advance.
2. Download and install `Navicat`, connect to the local database through it and import the `mini_order.sql` file to build a data table.
3. If you need to re-develop the source code, please first download the `IDEA` compiler and import this project into it, and finally execute the `ServerApplication.java` file to run the project. Note: Please set your database account and password in the `application.yaml` configuration file.