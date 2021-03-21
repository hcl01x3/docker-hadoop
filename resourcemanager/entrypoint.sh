#!/bin/bash


if [[ "$1" = "hadoop-rm" ]]; then
  yarn resourcemananger
else
  exec "$@"
fi
