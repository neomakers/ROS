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

  # 在这里指定要安装的包名称
  package_to_install="git gcc"
  install_package "$package_to_install"

  package_to_install="vim universal-ctags xclip xclip astyle python-setuptools wget"
  install_package "$package_to_install"
  
  
  package_to_install="vim"
  install_package "$package_to_install"
  
  sudo easy_install -ZU autopep8
  sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
  rm -rf ~/vim* 2>&1 >/dev/null
  rm -rf ~/.vim* 2>&1 >/dev/null
  mv -f ~/vim ~/vim_old
  cd ~/ && git clone https://gitee.com/suyelu/vim.git
  mv -f ~/.vim ~/.vim_old 2>&1 >/dev/null
  mv -f ~/vim ~/.vim 2>&1 >/dev/null
  mv -f ~/.vimrc ~/.vimrc_old 2>&1 >/dev/null
  mv -f ~/.vim/.vimrc ~/
  git clone https://gitee.com/suyelu/vundle.git ~/.vim/bundle/vundle
  echo "程序正在自动安装相应插件" > kaikeba
  echo "command-t插件需要等待时间较长，不要担心" >> kaikeba
  echo "切勿强制退出该界面，否则会导致错误，需重新配置" >> kaikeba
  echo "安装完毕将自动退出" >> kaikeba
  echo "请耐心等待" >> kaikeba
  vim kaikeba -c "BundleInstall" -c "q" -c "q"
  rm kaikeba
  echo "安装完成"
  echo "脚本执行完毕"
}

# 调用主程序
main
