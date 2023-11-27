## 命名'simple.launch'
```html
<launch>
    <node pkg="learning_topic" type="person_subscriber" name="talker" output="screen" />
    <node pkg="learning_topic" type="person_publisher" name="listener" output="screen" /> 
</launch>
```

## 命名`turtlesim_parameter_config.launch`

‵‵`html
<launch>
	<param name="/turtle_number"   value="2"/>

    <node pkg="turtlesim" type="turtlesim_node" name="turtlesim_node">
		<param name="turtle_name1"   value="Tom"/>
		<param name="turtle_name2"   value="Jerry"/>

		<rosparam file="$(find learning_launch)/config/param.yaml" command="load"/>
	</node>
    <node pkg="turtlesim" type="turtle_teleop_key" name="turtle_teleop_key" output="screen"/>
</launch>
```

其中param.yaml文件在learning_launch功能包下的config文件夹下，其中$(find learning_launch)是寻找功能包的含义。其中param.yaml文件中包含内容如下
```shell
A: 123
B: "hello"

group:
  C: 456
  D: "hello"
```

## 命名`start_tf_demo_c++.launch`
```html
 <launch>
    <!-- Turtlesim Node-->
    <node pkg="turtlesim" type="turtlesim_node" name="sim"/>
    <node pkg="turtlesim" type="turtle_teleop_key" name="teleop" output="screen"/>

    <node pkg="learning_tf" type="turtle_tf_broadcaster" args="/turtle1" name="turtle1_tf_broadcaster" />
    <node pkg="learning_tf" type="turtle_tf_broadcaster" args="/turtle2" name="turtle2_tf_broadcaster" />
    <node pkg="learning_tf" type="turtle_tf_listener" name="listener" />
  </launch>
```

## 命名`turtlesim_remap.launch`
```html
<launch>
	<include file="$(find learning_launch)/launch/simple.launch" />

    <node pkg="turtlesim" type="turtlesim_node" name="turtlesim_node">
		<remap from="/turtle1/cmd_vel" to="/cmd_vel"/>
	</node>

</launch>
```
