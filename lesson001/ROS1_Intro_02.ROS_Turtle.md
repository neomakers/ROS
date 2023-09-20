# Turtle 命令
  通过命令行操控Turtle，就会用到ROS命令，常见的ROS命令，可以参考[ClearPathRobtics官方](https://clearpathrobotics.com/ros-robot-operating-system-cheat-sheet/)详见[下载melodic命令文件]()
## 01.准备工作：
  1. 打开Terminal, 输入```roscore```；
  2. 打开Terminal, 输入```rosrun turtlesim turtlesim_node```。启动节点；
  3. 打开Terminal, 输入```rosrun turtlesim turtle_teleop_key```。启动控制键盘；
### 02 图形查看节点信息
启动查看工具rqt_graph。打开Terminal，输入```rqt_graph```。启动图产看工具。
     
![图](https://github.com/neomakers/ROS/blob/main/lesson001/lesson02rosgraph.png)

(提示，如果roscore，rosrun等ros命令不要用，需要将ros添加至环境变量,```source /opt/melodic/setup.bash```)

## 02.加载配置文件不用每次输入```source /opt/melodic/setup.bash```
每次Terminal打开都会通运行配置文件`.bashrc`文件。通过在`.bashrc`文件中添加```source /opt/melodic/setup.bash```命令。从而使得每次启动自动加载ROS命令。
```SHELL
vim ~/.bashrc
```
### Vim 编辑器简单使用
vim编辑器，在命令状态下按下`GG`，会自动跳转至文件最后。然后按下`o`会插入一行,此时进入到编辑状态。
```SHELL
source /opt/melodic/setup.bash
```
按下键盘上的`ESC`按键，此时跳转到命令状态。此时输入冒号`:w`按下`Enter`按键。将保存(其中w是write的缩写，写入)。然后输入`:q`按`Enter`按键，退出。（其中`q`为quit的缩写）。
恭喜你，至此以后打开Terminal会自动加载ROS命令了。不用每次输入`source /opt/ros/melodic/setup.bash`

## 03. 常见ROS命令
### `rosnode`
  是查看节点命令，按住`Tab`按键，可以查看后面的选项。
### `rosnode list`
  产看`rosnode`的列表输入命令`rosnode list`得到如下结果,其中`rosout`是ROS当中发送log信息的文件，启用roscore机会产生此节点
  ```SHELL
  /rosout
  /teleop_turtle
  /turtlesim
  ```
### `rosnode info`
  查看相应节点的信息，比如上述节点中`\turtlesim`,输入`rosnode info \turtlesim`,输出如下。其中我们可以看到`Subscriptions: * /turtle1/cmd_vel [geometry_msgs/Twist]`这一项。
  ```SHELL
    --------------------------------------------------------------------------------
    Node [/turtlesim]
    Publications: 
     * /rosout [rosgraph_msgs/Log]
     * /turtle1/color_sensor [turtlesim/Color]
     * /turtle1/pose [turtlesim/Pose]
    
    Subscriptions: 
     * /turtle1/cmd_vel [geometry_msgs/Twist]
    
    Services: 
     * /clear
     * /kill
     * /reset
     * /spawn
     * /turtle1/set_pen
     * /turtle1/teleport_absolute
     * /turtle1/teleport_relative
     * /turtlesim/get_loggers
     * /turtlesim/set_logger_level
    
    
    contacting node http://ubuntu-Inspiron-3543:43827/ ...
    Pid: 11685
    Connections:
     * topic: /rosout
        * to: /rosout
        * direction: outbound (59849 - 127.0.0.1:38862) [28]
        * transport: TCPROS
     * topic: /turtle1/cmd_vel
        * to: /teleop_turtle (http://ubuntu-Inspiron-3543:38425/)
        * direction: inbound (51512 - ubuntu-Inspiron-3543:37383) [30]
        * transport: TCPROS

  ```
