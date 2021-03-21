#!/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin

export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/etc/hadoop"}
export HADOOP_INIT_CONF_DIR=${HADOOP_INIT_CONF_DIR:-"./confs"}

. ./helpers.sh

configureXML core-site.xml CORE_SITE
configureXML hdfs-site.xml HDFS_SITE
configureXML yarn-site.xml YARN_SITE
configureXML httpfs-site.xml HTTPFS_SITE
configureXML kms-site.xml KMS_SITE
configureXML mapred-site.xml MAPRED_CONF

exec "$@"
