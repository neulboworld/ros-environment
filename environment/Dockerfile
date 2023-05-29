FROM ros:foxy
ARG USERNAME=neulboworld
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# install ros package
COPY  change_mirror.sh /root
COPY  KR.txt /root

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
#    sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd && \
    chmod 0440 /etc/sudoers.d/$USERNAME

RUN chmod 755 /root/change_mirror.sh && \
    /root/change_mirror.sh && \
    rm /root/change_mirror.sh /root/KR.txt && \
    apt update && apt install -y \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    python3-pip \
    python3-rosinstall \
    ros-${ROS_DISTRO}-rviz2 \
    ros-${ROS_DISTRO}-demo-nodes-cpp \
    ros-${ROS_DISTRO}-demo-nodes-py \
    x11-apps \
    vim && \
    rm -rf /var/lib/apt/lists/* && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash" | tee -a /home/$USERNAME/.bashrc && \
    mkdir /home/$USERNAME/workspace && \
    mkdir /home/$USERNAME/workspace/sandbox
#    rosws init /home/$USERNAME/workspace /opt/ros/foxy && \
#    rosws set /home/$USERNAME/workspace/sandbox && \
#    echo "source ~/workspace/setup.bash" | tee -a /root/.bashrc

USER neulboworld

ENV SHELL /bin/bash

WORKDIR /home/$USERNAME

# launch ros package
CMD ["bash"]

