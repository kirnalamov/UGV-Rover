#!/bin/bash
cd /home/ws/ugv_ws
source install/setup.bash
export UGV_MODEL=ugv_rover
ros2 run ugv_tools keyboard_ctrl
