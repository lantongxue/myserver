# 这是什么？

这是一个Home Lab服务，旨在实现各种杂七杂八的功能，目的是打造一个超聚合系统！

# 有什么用？

即有用，也没用，反正就是想做什么就做什么！

# 关键词

#NAS、#网盘、#相册、#组网、#内网穿透、#短信上报

# 功能计划

* [X]  基于RBAC的权限管理
  * [X]  管理员
  * [X]  角色
  * [X]  菜单
* [X]  基础用户模块
* [X]  系统设置
  * [X]  基础设置
  * [X]  字典管理
  * [X]  附件管理
* [X]  开发辅助
  * [X]  数据表管理
  * [X]  表单构建
* [X]  手机短信上报
  * [X]  短信列表
  * [X]  授权管理
  * [X]  上报接口

# 怎么运行？

此系统基于`php`和`webman`框架开发，参考`webman`官方的运行方式。但是我建议使用`docker`部署。

## docker部署(推荐)

支持的环境变量

| 变量                         | 作用                    | 示例                      |
|----------------------------|-----------------------|-------------------------|
| DB_DRIVER                  | 数据库驱动`mysql`、`sqlite` | 默认为`mysql`              |
| DB_MYSQL_HOST              | MySQL数据库地址            | `127.0.0.1`             |
| DB_MYSQL_PORT              | MySQL数据库端口            | 默认为`3306`               |
| DB_MYSQL_NAME              | MySQL数据库名字            | `myserver`              |
| DB_MYSQL_USER              | MySQL数据库账号            | `root`                  |
| DB_MYSQL_PASS              | MySQL数据库密码            | `root`                  |
| DB_MYSQL_CHARSET           | MySQL数据库字符集           | 默认为`utf8mb4`            |
| DB_MYSQL_CHARSET_COLLATION | MySQL数据库字符集排序规则       | 默认为`utf8mb4_general_ci` |
| DB_SQLITE_DB               | sqlite数据库路径           | `./myserver.db`         |

创建并写入环境变量到`.env`文件中。
```shell
cat > .env <<EOF
# 数据库类型支持：mysql、sqlite
DB_DRIVER=mysql

# mysql配置
DB_MYSQL_HOST=127.0.0.1
DB_MYSQL_PORT=3306
DB_MYSQL_NAME=myserver
DB_MYSQL_USER=root
DB_MYSQL_PASS=root
DB_MYSQL_CHARSET=utf8mb4
DB_MYSQL_CHARSET_COLLATION=utf8mb4_general_ci

# sqlite配置
DB_SQLITE_DB=./myserver.db
EOF
```

### docker一键部署
```shell
docker run -d name=myserver --env-file .env -p 8787:8787 ghcr.io/lantongxue/myserver:latest
```

### docker compose 部署
创建`docker-compose.yml`文件，并确保`.env`和`docker-compose.yml`在同一目录中。
```shell
cat > docker-compose.yml <<EOF
services:
  myserver:
    image: ghcr.io/lantongxue/myserver:latest
    environment:
      # 数据库类型支持：mysql、sqlite
      - DB_DRIVER=${DB_DRIVER}
      # mysql配置
      - DB_MYSQL_HOST=${DB_MYSQL_HOST}
      - DB_MYSQL_PORT=${DB_MYSQL_PORT}
      - DB_MYSQL_NAME=${DB_MYSQL_NAME}
      - DB_MYSQL_USER=${DB_MYSQL_USER}
      - DB_MYSQL_PASS=${DB_MYSQL_PASS}
      - DB_MYSQL_CHARSET=${DB_MYSQL_CHARSET}
      - DB_MYSQL_CHARSET_COLLATION=${DB_MYSQL_CHARSET_COLLATION}
      # sqlite配置
      - DB_SQLITE_DB=${DB_SQLITE_DB}
    ports:
      - "8787:8787"
EOF
```
运行
```shell
docker compose up -d
```

## 手动部署


| 基础环境     | 版本       |
|----------|----------|
| php      | >= 8.4.5 |
| mysql    | >= 8.0   |
| composer | >= 2     |

php需要安装以下扩展


| 扩展         | 版本 | 是否必装           |
|------------|----|----------------|
| gd         | -  | ✔              |
| pcntl      | -  | ✔              |
| pdo_mysql  | -  | ✔              |
| pdo_sqlite | -  | ❌和pdo_mysql二选一 |
| sockets    | -  | ✔              |
| event      | -  | ✔              |
| imagic     | -  | ❌              |
| redis      | -  | ❌              |
| swoole     | -  | ❌              |

composer安装依赖

```shell
composer install
```

修改数据库信息，将根目录下的`.env.example`复制为`.env`，然后根据你的实际情况修改。

默认支持`mysql`、`sqlite`两种数据库驱动。

导入基本数据，用任何你熟悉的工具将`database/db.sql`导入到数据库中。

运行系统:

Linux(推荐)

```shell
php webmain start
```

Windows

```shell
php windows.php
```

更多用法参考`webman`官方文档。

## 访问系统

再通过上述任意一种方式部署后，打开浏览器访问：http://your_ip:8787/app/admin

默认的账号和密码是：admin/admin

# 参与贡献

你可以贡献你的代码，补丁、新功能、文档都可以。

如果要新增功能必须提交完整的功能代码、数据库结构、示例数据、使用文档等，至少要保证基础可用！ 不接受任何残次品功能代码！

不要求严格的开发规范，但不能太随意，必须要保证代码的可读性！

# 讨论群组

暂时没有，后面再建。

# 关于捐赠

此项目基本上是为爱发电，如果你愿意捐赠可以联系我，或者联系相关功能的开发者。

# 开源协议

MIT
