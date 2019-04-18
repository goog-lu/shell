#!/usr/bin/env bash
#
# encoding: utf8
# author: Googlu
# date: 2019/04/11

printf "Install depending software and init server computer......"
rpm -qa | grep mariadb-libs
if [ $? -eq 0 ];then
  rpm -e --nodeps mariadb-libs
else
  yum -y install ncurses ncurses-devel bison libgcrypt perl make cmake &>/dev/null
  if [ $? -eq 0 ];then
    yum -y groupinstall "Development Tools" &>/dev/null 
  fi
fi
printf "OK.../"


printf "Download MySQL Server Source code packages....../"
wget -O /opt/mysql.tar.gz https://dev.mysql.com/get/Downloads/MySQL-5.7/$1
printf "OK.../"


printf "Install MySQL Server's already operations....../"
groupadd mysql && useradd -M -g mysql -s /sbin/nologin mysql
mkdir -p /usr/local/mysqld/{data,mysql,log,tmp}
chown -R mysql:mysql /usr/local/mysqld/*
printf "OK.../"

printf "Install MySQL Server Begin....../"
tar xf /opt/mysql.tar.gz -C /opt/
cmake /opt/$(echo $1 | awk -F"." '{ print $1"."$2"."$3 }') \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysqld/mysql \
-DMYSQL_DATADIR=/usr/local/mysqld/data \
-DWITH_BOOST=/root/mysql-5.7.24/boost \
-DDEFAULT_CHARSET=utf8

if [ $? -eq 0 ];then
  make -j $(lscpu | awk 'NR==4{ print $2 }')
  if [ $? -eq 0 ];then
    make install
    if [ $? -eq 0 ];then
      printf "Good! Please Using MySQL Server."
    fi
  fi
else:
  printf "Error: cmake have unkonw warning."
  exit
fi

##初始化MySQL安装配置
#1.提升MySQL命令为系统级别命令
echo "export PATH=$PATH:/usr/local/mysqld/mysql/bin" >>/etc/profile
source /etc/profile

#2.拷贝默认配置文件至/etc/my.cnf中
chown -R mysql.mysql /usr/local/mysqld/*
cp /etc/{my.cnf,my.cnf.bak}
cp /usr/local/mysqld/mysql/mysql-test/include/default_mysqld.cnf /etc/my.cnf
cat >> /etc/my.cnf << EOF
basedir = /usr/local/mysqld/mysql
datadir = /usr/local/mysqld/data
tmpdir = /usr/local/mysqld/tmp
socket = /usr/local/mysqld/tmp/mysql.sock
pid_file = /usr/local/mysqld/tmp/mysqld.pid
log_error = /usr/local/mysqld/log/mysql_error.log
slow_query_log_file = /usr/local/mysqld/log/slow_warn.log

server_id = 11
user = mysql
port = 3306
bind-address = 0.0.0.0
character-set-server = utf8
default_storage_engine = InnoDB
EOF
ip=`ip a | grep "/24 brd" | awk -F"." '{print $4}' | awk -F"/" '{print $1}'`
sed -ri "s/server_id = 11/server_id = $ip /g" /etc/my.cnf

#3.执行数据库服务初始化操作
mysqld --defaults-file=/etc/my.cnf --initialize --user='mysql' 
#4.启动mysqld服务
mysqld_safe --defaults-file=/etc/my.cnf &
#5.设置mysql.socket软链接到mysql命令指定的目录中
ln -s /usr/local/mysqld/tmp/mysql.sock /tmp/mysql.sock

#6.配置mysqld服务的管理工具
chkconfig_tools (){
cp /usr/local/mysqld/mysql/support-files/mysql.server /etc/init.d/mysqld
chkconfig --add mysqld
chkconfig mysql on
}

##登录数据库并进行更改密码
password=`grep "password" /usr/local/mysqld/log/mysql_error.log | awk -F" " 'NR==1{print $11}'`
read -p "Please enter the password you want to change：" passwd
mysql -uroot -p"$password" -e "alter user 'root'@'localhost' identified by '$passwd';"




