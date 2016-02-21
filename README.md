# typecho-docker
typecho + pgsql 镜像

## 环境
* docker
* docker-compose

**注意**: docker-compose 版本应与 docker 对应, 例如：docker-compose 1.3.x 对应 docker 1.6 以及以后版本

## 构建
```
./build.sh
```

## 配置

### 数据库
镜像中默认配置博客使用 PGSQL, 相关环境变量在 `docker-compose.yml` 中设置

[postgres配置](https://hub.docker.com/_/postgres/)

### typecho
默认情况下
* 博客程序保存在当前目录下 `app` 文件夹中
* 数据库文件保存在 `dbdata` 中
* 端口映射到主机 80 端口, 在 `docker-compose.yml` 中配置
* 镜像中 nginx 配置为 `nginx/typecho`
* 数据库默认地址

**注意**: 在构建完成并且容器运行后, 需要运行向导后可能需要手动创建 `config.inc.php`

[端口配置](https://docs.docker.com/compose/compose-file/#ports)

#### url重写
已在nginx中配置, 直接在后台设置`设置/永久连接/是否使用地址重写功能`强制启用
