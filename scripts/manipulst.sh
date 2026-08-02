#!/bin/bash
set -e

cd ~/ws/roarm_ws
source /opt/ros/humble/setup.bash
source install/setup.bash

# Настоящий путь к файлу с учетом вложенной папки roarm_m3:
MODEL_PATH=$(ros2 pkg prefix --share roarm_description)/urdf/roarm_m3/roarm_m3.xacro

echo "Генерация URDF из $MODEL_PATH ..."
xacro "$MODEL_PATH" > /tmp/roarm_m3.urdf

ros2 run gazebo_ros spawn_entity.py \
  -file /tmp/roarm_m3.urdf \
  -entity roarm_m3 \
  -x 0 -y 0 -z 0.1
