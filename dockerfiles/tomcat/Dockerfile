FROM tomcat:7.0.85-jre7-alpine

ENV  TIME_ZONE Asia/Shanghai

RUN apk add --no-cache tzdata \  
&& echo "${TIME_ZONE}" > /etc/timezone \ 
&& ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime