#!/bin/bash

if [[ "$1" = "hadoop-hs" ]]; then
  yarn historyserver
else
  exec "$@"
fi
