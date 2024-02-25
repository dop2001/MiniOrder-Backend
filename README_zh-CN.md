## 1、简介

该仓库为微信点餐小程序miniOrder的后端服务代码，使用到的技术和工具有:

- SpringBoot
- Maven
- Redis
- MySQL
- Docker



## 2、部署步骤

> 数据库安装与设置

1、使用 `Docker` 拉取并安装 `MySQL `容器。

```shell
# 创建文件夹用于挂载
mkdir ~/mysql && cd ~/mysql
# 拉取mysql镜像
docker pull mysql:5.7
# 创建并运行mysql容器
docker run -id \
	-p 3306:3306 \ 
	-v $PWD/conf:/etc/mysql/conf.d \
	-v $PWD/logs:/logs \
	-v $PWD/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=123456 \
	--name mysql \
	mysql:5.7
```

2、执行 `mini_order.sql` 文件，将自动创建好项目所需要使用到的数据表。

```shell
# 克隆代码到当前用户文件夹下
cd ~ && git clone https://github.com/dop2001/MiniOrder-Backend.git
# 将sql文件复制到mysql容器的根目录下
docker cp MiniOrder-Backend/mini_order.sql mysql:/
# 进入mysql容器中
docker exec -it mysql /bin/bash
# 登录mysql
mysql -u root -p123456
# 运行sql文件
source mini_order.sql
```

> 运行代码

1、如果你需要对源码进行再次开发，请先下载 `IDEA`  编译器并将本项目导入进去，最后执行 `ServerApplication.java` 文件即可运行本项目。注意：请在 `application.yaml` 配置文件内设置你的数据库账号和密码等信息。

2、 你也可以使用 jar 包直接运行。

```shell
# 拉取jdk17镜像
docker pull openjdk:17-jdk-alpine
# --link使得当前容器能够访问mysql容器
docker run -id \
	-p 8080:8080 \
	--link mysql \
	--name miniOrder \
	openjdk:17-jdk-alpine
# 将jar包复制到容器内
docker cp MiniOrder-Backend/miniOrder.jar miniOrder:/
# 进入容器并运行jar包
docker exec -it miniOrder /bin/sh
# 运行jar包
java -jar miniOrder.jar
```

