# 自定义话题消息的使用
## 1.建立自定义话题消息
我们定义一个Topic的话题消息,其消息文件为`Person.msg`文件在`learning_topic`下面的`msg`文件夹下。可以考虑用`touch ~/catkin_ws/src/learning_topic/Person.msg`
```shell
string name
uint8 sex
uint8 age

uint8 unknown=0
uint8 male=1
uint8 female=2
```
## 2.修改对应package下面的编译选项
### 2.1package.xml修改编译和运行一类 
在package.xml中添加功能包依赖,其中第一条为编译依赖，第二条为运行依赖。
```shell
<build_depend>message_generation</build_depend>
<exec_depend>message_runtime</exec_depend>
```
### 2.2CmakeList语言编译运行依赖
在CmakeList.txt修改
```shell
#添加文件
find_pacakges(...
    message_generation)

#添加文件将.msg文件变成不同配置项的文件,第一条语句是指定接口
add_messsage_files(FILES Person.msg)
#第二条语句是指定指定文件对应的依赖，这里我们参考了std_msgs
generate_messages(DEPENDENCIES std_msgs)

#创建运行依赖,主要对应所说的是package.xml中的message_runtime
catkin_package(...message_runtime)
```
### 2.3编译尝试
我们在`catkin_make`后进入`devel`中的`include`可以看到`Person.h`的文件。这是上述配置生成的。打开发现是C++类的头文件。
## 3 通过Publish和Subscribe使用自定的Topic中的msg
### 3.1 建立Publish
在learning_topic下面的src文件夹创建person_publisher.cpp文件，文件具体内容如下：
```c++
#include <ros/ros.h>
#include "learning_topic/Person.h"

int main(int argc, char **argv)
{
    // ROS节点初始化
    ros::init(argc, argv, "person_publisher");

    // 创建节点句柄
    ros::NodeHandle n;

    // 创建一个Publisher，发布名为/person_info的topic，消息类型为learning_topic::Person，队列长度10
    ros::Publisher person_info_pub = n.advertise<learning_topic::Person>("/person_info", 10);

    // 设置循环的频率
    ros::Rate loop_rate(1);

    int count = 0;
    while (ros::ok())
    {
        // 初始化learning_topic::Person类型的消息
    	learning_topic::Person person_msg;
		person_msg.name = "Tom";
		person_msg.age  = 18;
		person_msg.sex  = learning_topic::Person::male;

        // 发布消息
		person_info_pub.publish(person_msg);

       	ROS_INFO("Publish Person Info: name:%s  age:%d  sex:%d", 
				  person_msg.name.c_str(), person_msg.age, person_msg.sex);

        // 按照循环频率延时
        loop_rate.sleep();
    }

    return 0;
}

```
### 3.2 建立Subscriber
同理在src文件夹下创建`person_subscriber.cpp`。
```c++
 
#include <ros/ros.h>
#include "learning_topic/Person.h"

// 接收到订阅的消息后，会进入消息回调函数
void personInfoCallback(const learning_topic::Person::ConstPtr& msg)
{
    // 将接收到的消息打印出来
    ROS_INFO("Subcribe Person Info: name:%s  age:%d  sex:%d", 
			 msg->name.c_str(), msg->age, msg->sex);
}

int main(int argc, char **argv)
{
    // 初始化ROS节点
    ros::init(argc, argv, "person_subscriber");

    // 创建节点句柄
    ros::NodeHandle n;

    // 创建一个Subscriber，订阅名为/person_info的topic，注册回调函数personInfoCallback
    ros::Subscriber person_info_sub = n.subscribe("/person_info", 10, personInfoCallback);

    // 循环等待回调函数
    ros::spin();

    return 0;
}
```
### 3.3 修改配置文件CMakeList.txt
打开CmakeList.txt文件，添加需要编译的文件信息，这里是`person_publisher.cpp`和`person_subscriber.cpp`相应的内容。
```shell
add_executable(person_pub src/person_publisher.cpp)
target_link_libraries(person_pub ${catkin_LIBRARIES})
add_dependencies(person_pub ${PROJECT_NAME}_generate_messages_cpp)

add_executable(person_sub src/person_subscriber.cpp)
target_link_libraries(person_sub ${catkin_LIBRARIES})
add_dependencies(person_sub ${PROJECT_NAME}_generate_messages_cpp)
```
## 4 重新编译和运行
- 1 .在catkin_ws空间下重新编译`catkin_make`
大家发现，我们在最后一段加上了一个动态链接，这个动态链接是根据我们生成msg文件定义有关。于自定义消息进行链接必须添加这么一段话。
- 2 .在Terminal非别输入以下语句使之运行
  - a. `roscore`
  - b. `rosrun learning_topic person_pub`
  - c. `rosrun learning_topic person_sub`
