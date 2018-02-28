[TOC]

### 下载镜像
docker pull sighof001/svn-server

### 环境变更
SVN_HOME=/home/svn
SVN_PORT=8004
SVN_REPO_NAME=my-repo


### 创建宿主机上的svn home
```
mkdir $SVN_HOME
```

### 启动容器
```
docker run --name svn-server \
           --detach \
           --volume $SVN_HOME:/var/opt/svn \
           --publish $SVN_PORT:3690 \
           sighof001/svn-server
```
### 创建仓库 my-repo
```
docker exec -it svn-server svnadmin create $SVN_REPO_NAME
```

### 备份配置
cd /home/svn/$SVN_REPO_NAME
cp -R conf conf.bak

### 配置svn
```
cd /home/svn/$SVN_REPO_NAME/conf
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
svn://localhost:8004/$SVN_REPO_NAME

此处localhost替换为宿主机ip