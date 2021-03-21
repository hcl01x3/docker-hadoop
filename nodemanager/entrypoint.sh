#!/bin/bash

if [[ "$1" = "hadoop-nm" ]]; then
  yarn nodemanager
else
  exec "$@"
fi
