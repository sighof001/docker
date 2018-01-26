[TOC]

### 设置svn目录
SVN_REPO:svn仓库根目录
SVN_BACKUP:svn备份目录
SVN_CONF:svn配置目录
```
SVN_REPO=/home/httpsvn/repo
SVN_BACKUP=/home/httpsvn/svn-backup
SVN_CONF=/home/httpsvn/dav_svn
```

### 创建容器
```
docker run -d -p 83:80 --name svn-with-httpd \
-v $SVN_REPO:/var/local/svn \
-v $SVN_BACKUP:/var/svn-backup \
-v $SVN_CONF:/etc/apache2/dav_svn/ \
sighof001/svn-with-httpd

```

### 创建仓库 my-repo
创建仓库只需要在仓库根目录(/var/local/svn)下新建一个目录。

cron每10分钟获取一次

```
cd $SVN_REPO
mkdir my-repo
```

### 配置svn
#### 用户配置文件，passwd
$SVN_CONF/dav_svn.passwd

```
htdigest $SVN_CONF/dav_svn.passwd Subversion lx
```

以上命令为httpd工具，如果没有，先执行下面语句安装

```
yum install httpd
```

#### 权限配置文件，authz
编辑配置文件
```
vi $SVN_CONF/dav_svn.authz
```

添加内容
```
[groups]
admin=lx
try=lx,csj,clx

[/]
@admin=rw

[my-repo:/]
@try=rw
```

### 访问仓库
http://yourDockerIp:83/svn/my-repo
