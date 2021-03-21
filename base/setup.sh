#!/bin/bash

export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/etc/hadoop"}
export HADOOP_CONF_TEMPLATE_DIR=${HADOOP_CONF_TEMPLATE_DIR:-"./confs"}

. ./helpers.sh

configureXML $HADOOP_CONF_TEMPLATE_DIR/core-site.xml $HADOOP_CONF_DIR/core-site.xml CORE_SITE
configureXML $HADOOP_CONF_TEMPLATE_DIR/hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml HDFS_SITE
configureXML $HADOOP_CONF_TEMPLATE_DIR/yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml YARN_SITE
configureXML $HADOOP_CONF_TEMPLATE_DIR/httpfs-site.xml $HADOOP_CONF_DIR/httpfs-site.xml HTTPFS_SITE
configureXML $HADOOP_CONF_TEMPLATE_DIR/kms-site.xml $HADOOP_CONF_DIR/kms-site.xml KMS_SITE
configureXML $HADOOP_CONF_TEMPLATE_DIR/mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml MAPRED_SITE

exec "$@"
