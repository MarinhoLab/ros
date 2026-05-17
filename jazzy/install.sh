#!/bin/bash
set -e

apt-get update
apt-get install -y software-properties-common curl
add-apt-repository universe

# Install ROS2 as instructed in https://ros2-tutorial.readthedocs.io/en/latest/installation.html
apt-get update
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

apt-get update
apt-get install -y ros-dev-tools
apt-get install -y ros-jazzy-desktop

echo "source /opt/ros/jazzy/setup.bash" >> /etc/bash_env
echo "source /etc/bash_env" >> ~/.bashrc

apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*