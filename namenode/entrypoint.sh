#!/bin/bash

if [[ "$1" = "hadoop-nn" ]]; then
  ./setup.sh
  hdfs namenode -format -nonInteractive
  hdfs namenode
else
  exec "$@"
fi
