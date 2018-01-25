[TOC]

### 下载镜像
docker pull sighof001/svn-server

### 创建宿主机上的svn home
```
mkdir /home/svn
```

### 启动容器
```
docker run --name svn-server \
           --detach \
           --volume /home/svn:/var/opt/svn \
           --publish 8004:3690 \
           sighof001/svn-server
```
### 创建仓库 my-repo
```
docker exec -it svn-server svnadmin create my-repo
```

### 配置svn
```
cd /home/svn/my-repo/conf
```

#### 用户配置文件，passwd
```
[users]
lx=lx
clx=clx
csj=csj
```

#### 权限配置文件，authz
```
[groups]
admin=lx
try=lx,csj,clx

[/]
@try=rw

```
#### 服务配置文件,svnserve.conf
放开以下三项
```
# 没有权限的用户不能访问
anon-access = none
# 用户配置文件
password-db = passwd
# 权限配置文件
authz-db = authz

```

### 访问仓库
svn://localhost:8004/my-repo

此处localhost替换为宿主机ip