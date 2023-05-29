#!/bin/bash

ARCH=$(uname -m)

docker stop ros2

if [ "$1" == "image" ]; then
    docker rmi neulboworld/ros-foxy:$ARCH
fi
