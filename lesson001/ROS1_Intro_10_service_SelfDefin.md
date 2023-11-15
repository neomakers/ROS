建立在srv文件夹在Person.srv文件
```shell
string name
uint8  age
uint8  sex

uint8 unknown = 0
uint8 male    = 1
uint8 female  = 2

---
string result
```
然后修改package.xml文件，添加
```shell
<build_depend>message_generation</build_depend>
<exec_depend>message_runtime</exec_depend>
```
```shell
findpackage(... message_generation)
add_service_files(FILES Person.srv)
generate_message(DEPENDENCIES std_msgs)
catkin_package(
 INCLUDE_DIRS include
 LIBRARIES learning_service
 message_runtime
)
```

建立一个person_client.cpp文件
```c++

#include <ros/ros.h>
#include "learning_service/Person.h"

int main(int argc, char** argv)
{
    // 初始化ROS节点
	ros::init(argc, argv, "person_client");

    // 创建节点句柄
	ros::NodeHandle node;

    // 发现/spawn服务后，创建一个服务客户端，连接名为/spawn的service
	ros::service::waitForService("/show_person");
	ros::ServiceClient person_client = node.serviceClient<learning_service::Person>("/show_person");

    // 初始化learning_service::Person的请求数据
	learning_service::Person srv;
	srv.request.name = "Tom";
	srv.request.age  = 20;
	srv.request.sex  = learning_service::Person::Request::male;

    // 请求服务调用
	ROS_INFO("Call service to show person[name:%s, age:%d, sex:%d]", 
			 srv.request.name.c_str(), srv.request.age, srv.request.sex);

	person_client.call(srv);

	// 显示服务调用结果
	ROS_INFO("Show person result : %s", srv.response.result.c_str());

	return 0;
};

```
