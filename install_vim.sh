#!/bin/bash
echo "This script will install and configure vim and zsh automatic."
echo "The time this takes is related to the network conditions, please wait patiently."
if [[ `whoami` == "root" ]];then
    echo -e "\033[31mYou are  running this script with Root\033[0m"
    echo -e "\033[31mGenerally, we do not recommend using root for programming or directly controlling your Linux OS, especially when you are a beginner \033[0m"
    echo -e "\033[31mSo, There is no necessary for you to configure with root."
    read -p "Do you really want to do this?[N/y]" choice
    if [[ ${choice} != y ]];then
    	echo "Bye."
    	exit 1
    fi
fi
if which apt-get >/dev/null; then
	sudo apt-get install -y vim  universal-ctags  xclip astyle python-setuptools  git wget
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel wget	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

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

