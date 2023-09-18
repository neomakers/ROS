ROS 入门
# 01 Turtle移动基础
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
4. 打开一个新的Terminal,rqt工具来查看之间的关系
   ```SHELL
   rqt_graph
   ```
5. 打开新的Terminal，也可以通过命令行查看节点具体信息
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

## 02 创建学习空间于功能包
```mermaid
graph TD;
 H[...pkg]
 I[...pkg]
 A[工作空间,workspace] --> B[功能包 package];
 A --> C[...pkg];
 A --> H;
 A --> I;
 B --> D[src];
 B --> E[build];
 B --> F[install]
 B --> G[devl];
```
1. 首先我们要创建一个文件夹
```SHELL
   mkdir -p ~/catkin_ws/src
```
2. 到相应的`src`文件夹下
3. 初始化

4. 编译


 

