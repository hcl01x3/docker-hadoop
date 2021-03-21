#!/bin/bash

if [[ "$1" = "hadoop-rm" ]]; then
  ./setup.sh
  yarn resourcemanager
else
  exec "$@"
fi
