
### 启动镜像
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v /home/docker/dockerdata/jenkins:/var/jenkins_home --restart always sighof001/jenkins

### 访问地址
http://203.75.156.151


