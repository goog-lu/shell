#!/usr/bin/env bash


function Install_Nginx() {
	if [ -f /etc/yum.repos.d/nginx.repo ];then
		yum -y install nginx
	else
		cp ./nginx.repo /etc/yum.repos.d/nginx.repo
		yum -y install nginx
	fi

	cp ./nginx_service.conf /etc/nginx/conf.d/default.conf
	cp ./404.html /usr/share/nginx/html/404.html
}

function Install_phpenv() {
	if [ -f /etc/yum.repos.d/remi-php.repo ];then
		yum -y install php73-php php73-php-xml php73-php-fpm php73-php-devel php73-php-mysql php73-php-gd php73-php-mbstring php73-php-mcrypt
	else
		cp ./remi-php.repo /etc/yum.repos.d/remi-php.repo
		yum -y install php73-php php73-php-xml php73-php-fpm php73-php-devel php73-php-mysql php73-php-gd php73-php-mbstring php73-php-mcrypt
	fi

	systemctl start php73-php-fpm && systemctl enable php73-php-fpm		
}

function Install_mysql() {
	if [ -f /etc/yum.repos.d/mysql-community.repo ];then
		yum -y install mysql-community-server
	else
		cp ./mysql-community.repo /etc/yum.repos.d/mysql-community.repo
		yum -y install mysql-community-server
	fi

	systemctl start mysqld && systemctl enable mysqld

	local old_passwd=`grep password /var/log/mysqld.log | awk -F" " 'NR==1 {print $11}'`
	local new_passwd="(BavDu..0326)"
	mysql -uroot -p"$old_passwd" --connect-expired-password -e "alter user 'root'@'localhost' identified by '$new_passwd';"
	mysql -uroot -p"$new_passwd" -e "create database wordpress;"
}

function CheckURL() {
	systemctl restart nginx && systemctl enable nginx
	if [ -f /usr/share/nginx/html/index.php ];then
		curl -I http://localhost
		if [ $? -eq 0 ];then
			printf "`date +%Y/%m/%d_%H:%M:%S` This nginx already no problem." >>./log/nginxwebservice_access.log
		else
			printf "`date +%Y/%m/%d_%H:%M:%S` [ERROR]: this page is not i visit." >>./log/nginxwebservice_error.log
		fi
	else
		curl -I http://localhost
		if [ $? -eq 0 ];then
			printf "`date +%Y/%m/%d_%H:%M:%S` [OK]: this nginx webservice is already installed." >>./log/nginxwebservice_access.log
		else
			printf "`date +%Y/%m/%d_%H:%M:%S` [ERROR]: this nginx webservice is not install error." >>./log/nginxwebservice_error.log
        fi
    fi
}



rpm -qa | grep nginx
if [ $? -eq 0 ];then
	printf "already installed nginx webservice."
else
	Install_Nginx
fi
CheckURL

rpm -qa | grep mysql
if [ $? -eq 0 ];then
	printf "already installed mysql database."
else
	Install_mysql
fi

rpm -qa | grep php73-php-fpm
if [ $? -eq 0 ];then
	printf "already installed php73-php-fpm service"
else
	Install_phpenv
fi
echo "<?php phpinfo(); ?>" >/usr/share/nginx/html/index.php
CheckURL


cp ./index.php /usr/share/nginx/html/index.php
CheckURL