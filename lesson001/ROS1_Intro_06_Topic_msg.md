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
### package.xml修改编译和运行一类 
在package.xml中添加功能包依赖,其中第一条为编译依赖，第二条为运行依赖。
```shell
<build_depend>message_generation</build_depend>
<exec_depend>message_runtime</exec_depend>
```
### CmakeList语言编译运行依赖
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
## 编译尝试
我们在`catkin_make`后进入`devel`中的`include`可以看到`Person.h`的文件。这是上述配置生成的。打开发现是C++类的头文件。
