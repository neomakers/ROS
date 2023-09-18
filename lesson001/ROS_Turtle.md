# 001Turtle 入门
## Topic 话题
1. ROS1 每次启动都需要用的一个`roscore，在Terminal中输入
   ```roscore```
2. 打开一个新的Terminal,启动一个海归仿真器,海归仿真器是一个工程，启动工程需要用`rosrun`
   ``` rosrun turtlesim turtlesim_node```
   其中`turtlesim`为一个功能包，`turtlesim_node`为仿真节点
3. 打开一个新的Terminal,其中海归控制器```rosrun turtlesim turtle_teleop_key```在此Terminal中输入上下左右可以移动小海龟。它也是一个节点
4. 其中rqt工具来查看不同的话题


