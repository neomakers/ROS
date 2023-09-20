# Turtle 命令
   通过命令行操控Turtle，就会用到ROS命令，常见的ROS命令，可以参考[ClearPathRobtics官方](https://clearpathrobotics.com/ros-robot-operating-system-cheat-sheet/)详见[下载melodic命令文件]()
## 01.准备工作：
   1. 打开Terminal, 输入```roscore```；
   2. 打开Terminal, 输入```rosrun turtlesim turtlesim_node```。启动节点；
   3. 打开Terminal, 输入```rosrun turtlesim turtle_teleop_key```。启动控制键盘；
### 02 图形查看节点信息
   启动查看工具rqt_graph。打开Terminal，输入```rqt_graph```。启动图产看工具。
     
   ![图](https://github.com/neomakers/ROS/blob/main/lesson001/pic/lesson02rosgraph.png)

   (提示，如果roscore，rosrun等ros命令不要用，需要将ros添加至环境变量,```source /opt/melodic/setup.bash```)

## 02.加载配置文件不用每次输入```source /opt/melodic/setup.bash```
   每次Terminal打开都会通运行配置文件`.bashrc`文件。通过在`.bashrc`文件中添加```source /opt/melodic/setup.bash```命令。从而使得每次启动自动加载ROS命令。
```SHELL
vim ~/.bashrc
```
### 02.1 Vim 编辑器简单使用
   vim编辑器，在命令状态下按下`GG`，会自动跳转至文件最后。然后按下`o`会插入一行,此时进入到编辑状态。
```SHELL
source /opt/melodic/setup.bash
```
   按下键盘上的`ESC`按键，此时跳转到命令状态。此时输入冒号`:w`按下`Enter`按键。将保存(其中w是write的缩写，写入)。然后输入`:q`按`Enter`按键，退出。（其中`q`为quit的缩写）。
   恭喜你，至此以后打开Terminal会自动加载ROS命令了。不用每次输入`source /opt/ros/melodic/setup.bash`

## 03. 常见ROS命令
### 03.1 `rosnode`
   是查看节点命令，按住`Tab`按键，可以查看后面的选项。
#### 03.1.1`rosnode list`
   产看`rosnode`的列表输入命令`rosnode list`得到如下结果,其中`rosout`是ROS当中发送log信息的文件，启用roscore机会产生此节点
  ```SHELL
  /rosout
  /teleop_turtle
  /turtlesim
  ```
#### 03.1.2`rosnode info`
    查看相应节点的信息，比如上述节点中`\turtlesim`,输入`rosnode info \turtlesim`,输出如下。其中我们可以看到`Subscriptions: * /turtle1/cmd_vel [geometry_msgs/Twist]`这一项。就是在[图](https://github.com/neomakers/ROS/blob/main/lesson001/pic/lesson02rosgraph.png)中看到的消息
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
### 03.2`rostopic`
  是产看话题相关信息多的领命
  #### 03.2.1`rostopic list`
  查看ROS的话题。
  ```SHELL
   /rosout
   /rosout_agg
   /turtle1/cmd_vel
   /turtle1/color_sensor
   /turtle1/pose
  ```
  ####  03.2.2`rostopic pub`
  发布信息，我们可以尝试通过该条命令向海归发送信息。设置X方向线速度为1。根据上述`rostopic list`可以知道相应的topic，这里是`/turtle1/cmd_vel`。根据查找相应的`rostopic info`可以知道相应内部的信息。`rostopic info /turtle1/cmd_vel`,其内部显现
   ```SHELL
      Type: geometry_msgs/Twist
      
      Publishers: 
       * /teleop_turtle (http://ubuntu-Inspiron-3543:38425/)
      
      Subscribers: 
       * /turtlesim (http://ubuntu-Inspiron-3543:43827/)
   ```
   
   我们知道`/turtle1/cmd_vel`的基本信息了，需要的是`geometry_msgs/Twist`。所以可以进行如下操作，给指定话题pub,注意如下代码大多是复制粘贴和Tab而非手写，自动生成为主。
   ```SHELL
   rostopic pub /turtle1/cmd_vel  geometry_msgs/Twist "linear:
   x: 1.0
   y: 0.0
   z: 0.0
   angular:
   x: 0.0
   y: 0.0
   z: 0.0" 
   ```
   我们不难发现执行上述命令后，海归至运动一次。通过修改上述命令中的增加-r 形成10Hz的重复，`r`代表的是repeat
   
   ```SHELL
   rostopic pub -r 10 /turtle1/cmd_vel  geometry_msgs/Twist "linear:
   x: 1.0
   y: 0.0
   z: 0.0
   angular:
   x: 0.0
   y: 0.0
   z: 0.1" 
   ```
### 03.04`rosmsg`查看消息
   比如我们要查看上述命令中的消息，`geometry_msgs/Twist`消息可以使用如下代码
   ```SHELL
   rosmsg show geometry_msgs/Twist
   ```
   得到如下结果：
   ```SHELL
   geometry_msgs/Vector3 linear
     float64 x
     float64 y
     float64 z
   geometry_msgs/Vector3 angular
     float64 x
     float64 y
     float64 z
   ```
   我们也可以通过`rosmsg `用TAB键补全，从而得到相应的全部选项
   ```SHELL
   list      md5       package   packages  show 
   ```
   通过`rosmsg list`我们可以查看定义好的信息文件其中的格式,我们启动一次package `rosmsg`机会加载一次。
   ```SHELL
   ubuntu@ubuntu-Inspiron-3543:~$ rosservice  list
   /clear
   /kill
   /reset
   /rosout/get_loggers
   /rosout/set_logger_level
   /spawn
   /teleop_turtle/get_loggers
   /teleop_turtle/set_logger_level
   /turtle1/set_pen
   /turtle1/teleport_absolute
   /turtle1/teleport_relative
   /turtlesim/get_loggers
   /turtlesim/set_logger_level
   ```
   其中我们这里要创建新的海归，需要使用`/spawn`,这里我们可以通过`rosservice info /spawn`查看相应的信息
   ```SHELL
   ubuntu@ubuntu-Inspiron-3543:~$ rosservice  info /spawn
   Node: /turtlesim
   URI: rosrpc://ubuntu-Inspiron-3543:59849
   Type: turtlesim/Spawn
   Args: x y theta name
   ```
   不难发现他是Node: /turtlesim节点下的。同理我们可以在`rosnode info /turtlesim`中看到这个相应信息
   ```SHELL
      ubuntu@ubuntu-Inspiron-3543:~$ rosnode info /turtlesim
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
