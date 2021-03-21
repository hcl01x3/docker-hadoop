#!/bin/bash

if [[ "$1" = "hadoop-dn" ]]; then
  hdfs datanode
else
  exec "$@"
fi
