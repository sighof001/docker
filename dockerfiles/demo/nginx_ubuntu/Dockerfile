FROM sshd:file

MAINTAINER lx

RUN apt-get install -y nginx && \
rm -rf /var/lib/apt/lists/* && \
echo '\ndaemon off;' >> /etc/nginx/nginx.conf && \
chown -R www-data:www-data /var/lib/nginx

RUN echo "Asia/Shanghai" > /etc/timezone \
dpkg-reconfigure -f noninteractive tzdata

ADD run.sh /run.sh
RUN chmod 755 /*.sh

VOLUME ["/etc/nginx/sites-enabled","/etc/nginx/certs","/etc/nginx/conf.d","/var/log/nginx"]

WORKDIR /etc/nginx

EXPOSE 80
EXPOSE 443

CMD ["run.sh"]


