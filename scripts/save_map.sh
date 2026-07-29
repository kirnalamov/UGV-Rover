#!/bin/bash
cd /home/ws/ugv_ws
source install/setup.bash
cd src/ugv_main/ugv_nav/maps
ros2 run nav2_map_server map_saver_cli -f ./map

