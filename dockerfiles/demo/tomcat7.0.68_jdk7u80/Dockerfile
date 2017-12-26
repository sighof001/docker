FROM sshd:dockerfile

MAINTAINER lx

ENV DEBIAN_FRONTEND noninteractive

RUN echo "Asia/Shanghai" > timezone && \
dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

ENV CATALINA_HOME /tomcat
ENV jdk /jdk
ENV JAVA_HOME /jdk

ADD apache-tomcat-7.0.68 /tomcat
ADD jdk1.7.0_80 /jdk

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
RUN chmod 755 /tomcat/bin/*.sh

EXPOSE 8080

CMD ["/run.sh"]