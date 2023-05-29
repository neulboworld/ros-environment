
USERNAME=neulboworld
CONTAINER_NAME=ros2
ARCH=$(uname -m)
ROS_DISTRIBUTION=foxy
IP_ADDR=$(ifconfig en0 | sed -n '/inet /p' | sed -e 's/ /\n/g' | sed -n '2p')

WORK_DIR=$(echo $PWD | sed -n 's/script/workdir/p')
echo "\n- CONTAINER NAME : ${CONTAINER_NAME}"
echo "- WORKSPACE PATH : ${WORK_DIR}\n"

docker run -itd --rm \
	--network=host \
	--name ${CONTAINER_NAME} --group-add video \
	-e "DISPLAY=host.docker.internal:0" \
	-v ${WORK_DIR}:/home/${USERNAME}/workspace \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	neulboworld/ros-${ROS_DISTRIBUTION}:${ARCH}

if [ $? -eq 0 ]; then
	echo "\n- RUN apt update :"
	docker exec -it -u ${USERNAME} ${CONTAINER_NAME} bash -c "sudo apt update"
fi

echo "\n"
./enter2docker.sh
