# ROS 入门
## 01 Turtle移动基础
### 01.1传统方法（打开多个Terminal)
1. ROS1 每次启动都需要用的一个`roscore，在Terminal中输入
   ```SHELL
   roscore
   ```
2. 打开一个新的Terminal,启动一个海归仿真器,海归仿真器`turtlesim`是一个功能包，启动功能把需要用`rosrun`。`turtlesim_node`为仿真节点
   ```SHELL
   rosrun turtlesim turtlesim_node
   ```
3. 打开一个新的Terminal,它也是一个节点
   ```SHELL
   rosrun turtlesim turtle_teleop_key
   ```
4. 打开一个新的Terminal,rqt工具来查看不同的话题
   ```SHELL
   rqt
   ```
### 01.2利用Launch文件一次性打开
`.launch`文件是一种启动文件，可以将多个命令合并启动。将上述代码整合到一个`.launch`文件。
```html
<launch>
 <node pkg="turtlesim" name="turle_sim" type="turtlesim_node"/>
 <node pkg="turtlesim" name="turle_mov" type="turtle_teleop_key"/>
</launch>
```
## 02 创建学习空间于功能包




