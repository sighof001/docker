
FROM ubuntu:14.04

MAINTAINER lx

RUN echo "deb http://mirrors.163.com/ubuntu/ precise-updates main restricted" > /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise-updates main restricted" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ precise-updates universe" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise-updates universe" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ precise multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ precise-updates multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise-updates multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /root/.ssh

RUN 
