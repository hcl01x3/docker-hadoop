#!/bin/bash

if [[ "$1" = "hadoop-ts" ]]; then
  ./setup.sh
  yarn timelineserver
else
  exec "$@"
fi
