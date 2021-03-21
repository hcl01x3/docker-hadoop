#!/bin/bash

exited=`docker ps -qa --no-trunc --filter "status=exited"`
if [ ! -z "${exited}" ]; then
    docker rm ${exited}
fi
