## 简介

该仓库为微信点餐小程序miniOrder的后端服务代码，使用到的技术和工具有:

- SpringBoot
- Maven
- Redis
- MySQL
- Docker



## 部署步骤

> 通过 jar 包运行 (Linux)

1. 安装  `docker` 和 `docker-compose` 。

   ```shell
   # 更新软件包索引
   sudo apt update
   
   # 安装必要的依赖软件
   sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
   
   # 导入源仓库的 GPG key
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   
   # 将Docker APT软件源添加到系统中
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   
   # 安装Docker最新版本
   sudo apt update
   sudo apt install docker-ce docker-ce-cli containerd.io
   ```

2. 运行 `docker-compose.yml`  文件以自动构建所需容器。

   ```shell
   # 创建一个空文件夹来保存项目文件
   mkdir project && cd project
   git clone https://github.com/dop2001/MiniOrder-Backend.git
   
   # 运行
   docker-compose up -d
   ```

3. 在数据库中创建数据表。

   ```bash
   # 进入mysql容器中
   docker exec -it mysql /bin/bash
   
   # 执行sql文件
   mysql -u root -p123456 < mini_order.sql
   ```

> 通过源码运行 (Linux & Win)

1. 系统需要提前安装 `Mysql` 和 `JDK 17` 环境。
2. 下载安装 `Navicat` ，通过其连接本地数据库并导入`mini_order.sql` 文件构建数据表。
3. 如果你需要对源码进行再次开发，请先下载 `IDEA`  编译器并将本项目导入进去，最后执行 `ServerApplication.java` 文件即可运行本项目。注意：请在 `application.yaml` 配置文件内设置你的数据库账号和密码等信息。

