# 接受话题的消息——订阅Subscribe
通过定义话题我们可以产看小海龟的位置。建立如下文件：pos_sub.cpp
如题代码如下：
```c++
#include <ros/ros.h>
#include "turtlesim/Pose.h"

// 接收到订阅的消息后，会进入消息回调函数
void poseCallback(const turtlesim::Pose::ConstPtr& msg)
{
    // 将接收到的消息打印出来
    ROS_INFO("Turtle pose: x:%0.6f, y:%0.6f", msg->x, msg->y);
}

int main(int argc, char **argv)
{
    // 初始化ROS节点
    ros::init(argc, argv, "pose_subscriber");

    // 创建节点句柄
    ros::NodeHandle n;

    // 创建一个Subscriber，订阅名为/turtle1/pose的topic，注册回调函数poseCallback
    ros::Subscriber pose_sub = n.subscribe("/turtle1/pose", 10, poseCallback);

    // 循环等待回调函数
    ros::spin();

    return 0;
}

```
同理我们要在相应的CMakeList.txt文件当中进行添加相应的内容
```shell
add_executable(pos_sub src/pos_sub.cpp)
target_link_libraries(pos_sub ${catkin_LIBRARIES})
```
```
