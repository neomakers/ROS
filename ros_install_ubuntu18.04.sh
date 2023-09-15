#!/bin/bash
# 检查是否具有管理员权限
check_admin_permission() {
  if [ "$(id -u)" -ne 0 ]; then
    echo "请以管理员权限运行此脚本"
    exit 1
  fi
}

# 更新系统包管理器
update_package_manager() {
  echo "正在更新系统包管理器..."
  apt update
}

# 安装指定包
install_package() {
  local package_name="$1"  # 获取传递的包名称
  echo "正在安装 $package_name..."
  apt install -y "$package_name" 2> install_error.log

  # 检查安装是否成功
  if [ $? -eq 0 ]; then
    echo "$package_name 安装成功"
  else
    echo "安装失败，请检查错误信息并手动解决"
    cat install_error.log  # 输出错误日志
  fi
}

# 主程序
main() {
  check_admin_permission
  update_package_manager
echo "adding the ROS repository to your ubuntu sources.list"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo "add the keys for accessing "

#一下代码参考来自https://answers.ros.org/question/325039/apt-update-fails-cannot-install-pkgs-key-not-working/
sudo -E apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

  update_package_manager  
# 在这里指定要安装的包名称
  package_to_install="ros-melodic-desktop-full"
  install_package "$package_to_install"

  echo "脚本执行完毕"
}

# 调用主程序
main
