#include <string>
#include <ros/ros.h>
#include <std_srvs/Empty.h>

int main(int argc, char **argv)
{
	int red, green, blue;

    // ROS节点初始化
    ros::init(argc, argv, "parameter_config");

    // 创建节点句柄
    ros::NodeHandle node;

    // 读取背景颜色参数
    char red_para[]="turtlesim/background_r";
    char blue_para[]="turtlesim/background_b";
    char green_para[]="turtlesim/background_g";
	ros::param::get(red_para, red);
	ros::param::get(blue_para, green);
	ros::param::get(green_para, blue);

	ROS_INFO("Get Backgroud Color[%d, %d, %d]", red, green, blue);

	// 设置背景颜色参数
	ros::param::set(red_para,255);
	ros::param::set(green_para, 255);
	ros::param::set(blue_para, 255);

	ROS_INFO("Set Backgroud Color[255, 255, 255]");

    // 读取背景颜色参数
    ros::param::get(red_para, red);
	ros::param::get(blue_para, green);
	ros::param::get(green_para, blue);

	ROS_INFO("Re-get Backgroud Color[%d, %d, %d]", red, green, blue);

	// 调用服务，刷新背景颜色
	ros::service::waitForService("/clear");
	ros::ServiceClient clear_background = node.serviceClient<std_srvs::Empty>("/clear");
	std_srvs::Empty srv;
	clear_background.call(srv);

	sleep(1);

    return 0;
}
