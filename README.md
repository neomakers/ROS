# ROS
该项目主要是为机器人系统(Robot Operating System)使用。
详细使用文档请参考官方 https://wiki.ros.org/
例如关于ROSParameter的详细使用可以参考 <link>https://wiki.ros.org/Parameter%20Server</link>
## 安装
### ROS1 安装配套ubuntu18.04
  针对不同版本的Ubuntu大家需要进行产看对应的ros_install_ubuntuXX.sh。如果你不知道自己的Ubuntu版本,请在终端输Terminal入如下命令查看`cat /proc/version`，打开Terminal,可以按住Ctrl+Alt+T，相关视频课参考:
  1. 在开始菜单选择中的Software Update,选择其中的Setting,选择其中的Ubuntu Software,选择其中的Download from。选择China中的一个站点,选择Choose Server。点击Close,选择Update,等待更新
  2. 在Terminal中输入`cd ~/Desktop`跳转到桌面路径
  3. 在Terminal中输入`sudo apt-get update`更新列表
  4. 在Terminal中输入`sudo apt-get install git`安装git
  5. 在Terminal中输入`git clone https://github.com/neomakers/ROS`
  6. 在Terminal中输入`cd ./ROS`进入到当前文件夹(`.`)下的`ROS`文件夹
  7. 在Terminal中输入`sudo bash ./vim_init.sh`然后输入登录用户的密码，安装vim和配置vim
  8. 在Terminal中输入`sudo bash ./ros_install_ubuntu18.04.sh`输入密码，安装ROS1

## 其他
## 安装前预读
### 入门使用说明
如果您对Vim使用有问题这里请参考vim常见使用系列说明相关文档
`:%s/oldtext/newtest/g`

     
