   本节课要实现建立一个名称为`learning_topic`的package,然后在该package下面创建一个名称为`velocity_publisher`的node。需要注意的是，所有的node都必须在package下面。
需要注意的是，在创建package之前，必须确保你已经创建了工作空间。这里我们按照lesson003中创建的工作空间`catkin_ws`中间中，继续执行。
所有的包文件必须在工作空间的源文件(source)文件夹`src`下建立。 这里移动到相应位置 `~/catkin_ws/src`。
   1. 需要创建的package，利用```catkin_create_pkg <package_name> [依赖package]```。
      ```SHELL
      catkin_create_pkg learning_topic roscpp rospy std_msgs geometry_msgs turtlesim
      ```
      执行上述命令后通过`ls`不难发现，已经形成了对应的包文件在工作空间`catkin_ws`的`src`文件夹下。
   2. 在相应的package文件夹下的src，创建```velocity_publisher.cpp```文件。
   3. 
