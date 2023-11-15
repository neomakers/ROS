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
