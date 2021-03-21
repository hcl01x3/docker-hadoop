#!/bin/bash

if [[ "$1" = "hadoop-dn" ]]; then
  ./setup.sh
  hdfs datanode
else
  exec "$@"
fi
