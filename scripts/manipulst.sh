#!/bin/bash
cd ~/ws/roarm_ws
source /opt/ros/humble/setup.bash
source install/setup.bash

ros2 run gazebo_ros spawn_entity.py \
  -file /tmp/roarm_m3.urdf \
  -entity roarm_m3 \
  -x 0 -y 0 -z 0.1

