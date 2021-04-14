FROM ubuntu:18.04

MAINTAINER octo-5 <hyochan.lee@gmail.com>

USER root
WORKDIR /root

RUN apt-get -y update && apt-get -y install \
    curl \
    openjdk-8-jdk \
    netcat \
  && rm -rf /var/lib/apt/lists/*

ENV HADOOP_VERSION 3.3.0
ENV HADOOP_URL http://mirror.kakao.com/apache/hadoop/common/stable/hadoop-$HADOOP_VERSION.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/usr/local/hadoop

ENV PATH=$PATH:$JAVA_HOME/bin
ENV PATH=$PATH:$HADOOP_HOME/bin
ENV PATH=$PATH:$HADOOP_HOME/sbin

RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
  && mkdir /usr/local/hadoop \
  && tar xzf /tmp/hadoop.tar.gz -C $HADOOP_HOME --strip-components 1 \
  && rm /tmp/hadoop.tar.gz*

RUN ln -s $HADOOP_HOME/etc/hadoop /etc/hadoop
RUN mkdir $HADOOP_HOME/logs

ADD confs ./confs
ADD helpers.sh ./helpers.sh
ADD setup.sh ./setup.sh
RUN chmod 0755 ./setup.sh

RUN ./setup.sh
