FROM ubuntu:18.04

MAINTAINER octo-5 <hyochan.lee@gmail.com>

USER root
WORKDIR /root

RUN apt-get -y update && apt-get -y install \
    wget \
    openjdk-8-jdk \
    netcat \
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_VERSION 3.3.0
ENV HADOOP_URL http://mirror.kakao.com/apache/hadoop/common/stable/hadoop-$HADOOP_VERSION.tar.gz

RUN wget "$HADOOP_URL" -O /tmp/hadoop.tar.gz \
  && mkdir /usr/local/hadoop \
  && tar xzf /tmp/hadoop.tar.gz -C $HADOOP_HOME --strip-components 1 \
  && rm /tmp/hadoop.tar.gz*

RUN ln -s $HADOOP_HOME/etc/hadoop /etc/hadoop
RUN mkdir $HADOOP_HOME/logs

ADD confs ./confs
ADD helpers.sh ./helpers.sh
ADD entrypoint.sh ./entrypoint.sh

RUN chmod a+x ./helpers.sh
RUN chmod a+x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
