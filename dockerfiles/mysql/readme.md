### 启动镜像
docker run -d -p 13306:3306 --name hxpay-db -e MYSQL_ROOT_PASSWORD="a111111" sighof001/mysql_utf8

### 新建数据库和用户

create database dbname;

CREATE USER 'user' IDENTIFIED BY 'password';

grant all privileges on user.* to user;

grant all privileges on *.* to root @"%" identified by "a111111";

flush privileges;

