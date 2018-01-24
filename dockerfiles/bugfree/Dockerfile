FROM sighof001/php-nginx

MAINTAINER lx

COPY nginx.conf /etc/nginx/nginx.conf

ADD bugfree3.0.4 /data/www/bugfree;
COPY run.sh /run.sh
RUN chmod 755 /run.sh

CMD ["/run.sh"]


