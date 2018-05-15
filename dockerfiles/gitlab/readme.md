
### 启动镜像
docker run --detach \
--hostname 203.75.156.154 \
--publish 443:443 --publish 80:80 --publish 1022:22 \
--name gitlab \
--restart always \
--volume /home/docker/gitlab/config:/etc/gitlab \
--volume /home/docker/gitlab/logs:/var/log/gitlab \
--volume /home/docker/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce:latest

### 从本机维护配置文件
copy gitlab.rb /home/docker/gitlab/config/gitlab.rb


### 访问地址
http://203.75.156.154
root
${password}

