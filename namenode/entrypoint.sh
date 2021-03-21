#!/bin/bash

if [[ "$1" = "hadoop-nn" ]]; then
  hdfs namenode -format -nonInteractive
  hdfs namenode
else
  exec "$@"
fi
