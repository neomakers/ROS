   本节课要实现建立一个名称为`learning_topic`的package,然后在该package下面创建一个名称为`velocity_publisher`的node。需要注意的是，所有的node都必须在package下面。
需要注意的是，在创建package之前，必须确保你已经创建了工作空间。这里我们按照lesson003中创建的工作空间`catkin_ws`中间中，继续执行。
所有的包文件必须在工作空间的源文件(source)文件夹`src`下建立。 这里移动到相应位置 `~/catkin_ws/src`。
   1. 需要创建的package，利用```catkin_create_pkg <package_name> [依赖package]```。这里面，我们应用了C++文件所以要依赖`roscpp`，要使用Python,所以要使用`rospy`。传递标准信息`std_msgs`，几何位置信息`geometry_msgs`,海归仿真器`turtlesim`等包。
      ```SHELL
      catkin_create_pkg learning_topic roscpp rospy std_msgs geometry_msgs turtlesim
      ```
      执行上述命令后通过`ls`不难发现，已经形成了对应的包文件'learing_topic'在工作空间`catkin_ws`的`src`文件夹下。当如上代码报错时，请查看ros变量是否加载到环境当中。`source /opt/ros/melodic/setup.bash`
   2. 在相应的package文件夹下的src，创建```velocity_publisher.cpp```文件。
      ```SHELL
      vim ./learning_topic/src/velocity_publisher.cpp
      ```
      然后粘贴如下代码：
      ```cpp 
            #include <ros/ros.h>
            #include <geometry_msgs/Twist.h>
            
            int main(int argc, char **argv)
            {
            	// ROS节点初始化
            	ros::init(argc, argv, "velocity_publisher");
            
            	// 创建节点句柄
            	ros::NodeHandle n;
            
            	// 创建一个Publisher，发布名为/turtle1/cmd_vel的topic，消息类型为geometry_msgs::Twist，队列长度10
            	ros::Publisher turtle_vel_pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);
            
            	// 设置循环的频率
            	ros::Rate loop_rate(10);
            
            	int count = 0;
            	while (ros::ok())
            	{
            	    // 初始化geometry_msgs::Twist类型的消息
            		geometry_msgs::Twist vel_msg;
            		vel_msg.linear.x = 0.5;
            		vel_msg.angular.z = 0.2;
            
            	    // 发布消息
            		turtle_vel_pub.publish(vel_msg);
            		ROS_INFO("Publsh turtle velocity command[%0.2f m/s, %0.2f rad/s]", 
            				vel_msg.linear.x, vel_msg.angular.z);
            
            	    // 按照循环频率延时
            	    loop_rate.sleep();
            	}
            
            	return 0;
            }

      ```
   4. 
