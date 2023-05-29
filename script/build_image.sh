#!/bin/bash

# Define ros distribution
ROS_DISTRIBUTION=foxy

# Get username to be used in the container
USERNAME=$1

# Get architecture info for tag
ARCH=$(uname -m)

# Set username as default value if no username arguments is received 
if [ $USERNAME == ""]; then
	USERNAME=neulboworld
	echo "Username is not defined. It will be set to '$USERNAME' automatically."
fi

# Define the file path to change the repository
DOCKER_ENV_FILE_DIR="../environment"
MIRROR_FILE="KR.txt"
MIRROR_FILE_PATH=${DOCKER_ENV_FILE_DIR}/${MIRROR_FILE}

# Download repository info of Korea region
wget mirrors.ubuntu.com/${MIRROR_FILE} -O ${MIRROR_FILE_PATH}

# Build ros docker image
docker build -t neulboworld/ros-${ROS_DISTRIBUTION}:$ARCH ${DOCKER_ENV_FILE_DIR} --build-arg USERNAME=$USERNAME
rm ${MIRROR_FILE_PATH}

