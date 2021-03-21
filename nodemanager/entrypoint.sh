#!/bin/bash

if [[ "$1" = "hadoop-nm" ]]; then
  ./setup.sh
  yarn nodemanager
else
  exec "$@"
fi
