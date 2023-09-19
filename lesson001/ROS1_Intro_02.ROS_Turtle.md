# Turtle 命令
  通过命令行操控Turtle，就会用到ROS命令，常见的ROS命令，可以参考[ClearPathRobtics官方](https://clearpathrobotics.com/ros-robot-operating-system-cheat-sheet/)详见[下载melodic命令文件]()
  准备工作：
  1. 打开Terminal, 输入```roscore```；
  2. 打开Terminal, 输入```rosrun turtlesim turtlesim_node```。启动节点；
  3. 打开Terminal, 输入```rosrun turtlesim turtle_teleop_key```。启动控制键盘；
  4. 启动查看工具rqt_graph。打开Terminal，输入```rqt_graph```。启动图产看工具。
(提示，如果roscore，rosrun等ros命令不要用，需要将ros添加至环境变量,```source /opt/melodic/setup.bash```)
