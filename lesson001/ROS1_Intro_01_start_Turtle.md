ROS 入门
# 01 Turtle移动基础
### 01.1传统方法（打开多个Terminal)
1. ROS1 每次启动都需要用的一个`roscore，在Terminal中输入
   ```SHELL
   roscore
   ```
   当输入`roscore`显示`Command 'roscore' not found...`时，说明我们的`ros`没有。输入如下命令返回为空
   ```SHELL
   echo $ROS_PACKAGE_PATH
   ```
   添加到环境变量之中，需要在Terminal 如下操作,从而增加环境变量。重复上述操作，会有输出。
   ```SHELL
   source /opt/ros/melodic/setup.bash
   echo $ROS_PACKAGE_PATH
   ```
   输出`/opt/ros/melodic/share`说明该位置的ROS变量(也就是ROS命令或者功能包)已经添加到环境变量当中。再执行`roscore`程序运行。
   
3. 打开一个新的Terminal,启动一个海归仿真器,海归仿真器`turtlesim`是一个功能包，启动功能把需要用`rosrun`。`turtlesim_node`为仿真节点
   ```SHELL
   rosrun turtlesim turtlesim_node
   ```
4. 打开一个新的Terminal,它也是一个节点
   ```SHELL
   rosrun turtlesim turtle_teleop_key
   ```
5. 打开一个新的Terminal,rqt工具来查看之间的关系
   ```SHELL
   rqt_graph
   ```
6. 打开新的Terminal，也可以通过命令行查看节点具体信息
   ```SHELL
   rosnode list
   ```
### 01.2利用Launch文件一次性打开
`.launch`文件是一种启动文件，可以将多个命令合并启动。将上述代码整合到一个`.launch`文件。
   ```html
   <launch>
    <node pkg="turtlesim" name="turle_sim" type="turtlesim_node"/>
    <node pkg="turtlesim" name="turle_mov" type="turtle_teleop_key"/>
    <node pkg="rqt_graph" name="rqt_graph" type="rqt_graph"/>
   </launch>
   ```
大家可以不输入`name`属性后面跟的取值让其为空`”“`,通过`rosnode list`查看具体节点名称，发现系统会自动分配名称。但是不建议如此使用
