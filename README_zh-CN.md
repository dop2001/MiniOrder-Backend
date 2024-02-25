## 1、简介

该仓库为微信点餐小程序miniOrder的后端服务代码，使用到的技术和工具有:

- SpringBoot
- Maven
- Redis
- MySQL



## 2、部署步骤

> 数据库安装与设置

1、使用 `Docker` 拉取并安装 `MySQL `容器。

```shell
mkdir ~/mysql && cd ~/mysql
docker pull mysql:5.7
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
cd .. && git clone https://github.com/dop2001/MiniOrder-Backend.git
docker cp MiniOrder-Backend/mini_order.sql mysql:/
docker exec -it mysql /bin/bash
mysql -u root -p
source mini_order.sql
```

> 运行代码

1、如果你对源码进行再次开发，请先下载 `IDEA`  编译器并将本项目导入进去，最后执行 `ServerApplication.java` 文件即可运行本项目。注意：请在 `application.yaml` 配置文件内设置你的数据库账号和密码等信息。

2、 你也可以直接使用 jar 运行本项目。

```shell

```

