
请在linux系统中安装好最新版的nginx web服务器程序，并完成启动，且能够正常的访问到欢迎页面？如何写出这样一个脚本？

思路：
	1. 安装好nginx
	2. 启动nginx
	3. 关闭防火墙和SELINUX

#!/usr/bin/env bash
#

cat <<-EOF >/etc/yum.repos.d/nginx.repo
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
EOF

yum clean all

yum -y install nginx

systemctl start nginx && systemctl enable nginx

systemctl stop firewalld && systemctl disable firewalld

setenforce 0







