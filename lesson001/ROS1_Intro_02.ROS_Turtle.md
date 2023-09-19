# Turtle 命令
  通过命令行操控Turtle，就会用到ROS命令，常见的ROS命令，可以参考[ClearPathRobtics官方](https://clearpathrobotics.com/ros-robot-operating-system-cheat-sheet/)详见[下载melodic命令文件]()
## 准备工作：
  1. 打开Terminal, 输入```roscore```；
  2. 打开Terminal, 输入```rosrun turtlesim turtlesim_node```。启动节点；
  3. 打开Terminal, 输入```rosrun turtlesim turtle_teleop_key```。启动控制键盘；
  4. 启动查看工具rqt_graph。打开Terminal，输入```rqt_graph```。启动图产看工具。
     
(提示，如果roscore，rosrun等ros命令不要用，需要将ros添加至环境变量,```source /opt/melodic/setup.bash```)

## 加载配置文件
每次Terminal打开都会通运行配置文件`.bashrc`文件。通过在`.bashrc`文件中添加```source /opt/melodic/setup.bash```命令。从而使得每次启动自动加载ROS命令。
```SHELL
vim ~/.bashrc
```
### Vim 编辑器简单使用
vim编辑器，在命令状态下按下GG，会自动跳转至文件最后。然后按下o会插入一行。
```SHELL
source /opt/melodic/setup.bash
```
