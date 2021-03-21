#!/bin/bash

export HIVE_CONF_DIR=${HIVE_CONF_DIR:-"/etc/hive"}
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/etc/hadoop"}
export HADOOP_CONF_TEMPLATE_DIR=${HADOOP_CONF_TEMPLATE_DIR:-"./confs"}

if [[ "$1" = "hiveserver" ]]; then
  . ./helpers.sh
  ./setup.sh
  configureXML $HADOOP_CONF_TEMPLATE_DIR/hive-site.xml $HIVE_CONF_DIR/hive-site.xml HIVE_SITE
  GLOBIGNORE=""

  hdfs dfs -mkdir -p /user/hive/warehouse
  hdfs dfs -mkdir -p /tmp

  hdfs dfs -chmod g+x /user/hive/warehouse
  hdfs dfs -chmod g+x /tmp

  schematool -dbType postgres -initSchema

  hive --service hiveserver2 --hiveconf hive.root.logger=DEBUG,console
else
  exec "$@"
fi
