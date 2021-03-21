FROM octo5/hadoop-base:3.3.0

MAINTAINER octo-5 <hyochan.lee@gmail.com>

USER root
WORKDIR /root

ENV HIVE_VERSION=3.1.2
ENV HIVE_URL=http://mirror.navercorp.com/apache/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz
ENV POSTGRES_JAR=/usr/share/java/postgresql.jar

ENV HIVE_HOME=/usr/local/hive
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ENV PATH=$PATH:$HIVE_HOME/bin
ENV PATH=$PATH:$JAVA_HOME/bin

RUN apt-get -y update && apt-get install -y curl procps openjdk-8-jdk libpostgresql-jdbc-java \
  && curl -fSL "$HIVE_URL" -o /tmp/hive.tar.gz \
  && mkdir -p $HIVE_HOME \
  && tar xzf /tmp/hive.tar.gz -C $HIVE_HOME --strip-components 1 \
  && rm /tmp/hive.tar.gz

RUN rm -f $HIVE_HOME/lib/guava-19.0.jar \
  && ln -s $HADOOP_HOME/share/hadoop/common/lib/guava-27.0-jre.jar $HIVE_HOME/lib
RUN ln -s $POSTGRES_JAR $HIVE_HOME/lib/postgresql.jar
RUN ln -s $HIVE_HOME/conf /etc/hive

RUN rm -rf /var/lib/apt/lists/*

#HEALTHCHECK CMD curl -f http://localhost:10002/ || exit

EXPOSE 10000 10002

ADD confs/hive-site.xml ./confs/hive-site.xml
ADD entrypoint.sh ./entrypoint.sh
RUN chmod 0755 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["hiveserver"]
