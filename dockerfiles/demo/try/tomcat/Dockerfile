FROM tomcat7.0.68:jdk7u80

MAINTAINER lx

ADD home /home
ADD try /tomcat/webapps/try
ADD console /tomcat/webapps/console
ADD batch /tomcat/webapps/batch

COPY server.xml /tomcat/conf/server.xml
COPY catalina.sh /tomcat/bin/catalina.sh

RUN chmod -R 755 /tomcat

CMD ["/run.sh"]




