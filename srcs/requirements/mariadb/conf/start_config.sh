#!/bin/sh
if [ ! -d /var/lib/mysql/mysql ]; then
{
	echo -e "\t\033[33m/var/lib/mysql/mysql not founded\033[0m"
	echo -e "\n\033[33mStart instalation mariadb\n\033[0m"
	mysql_install_db
	if [ $? == 0 ]; then
		echo -e "\t\033[32mMaria db correctly installed\033[0m"
	else
		echo -e "\t\033[31mERROR: Maria db couldn't be installed\033[0m"
		exit 1
	fi

	mysqld_safe &
	if [ $? == 0 ]; then
		echo -e "\t\033[32mmysqld_safe correctly started\033[0m"
	else
		echo -e "\t\033[31m32mERROR: mysqld_safe has a problem during ths starting process\033[0m"
		exit 1
	fi

	sleep 3
	echo -e "\t\n\033[33mExecuting comands.sql script to create mysqld users and passwords\n\033[0m"
	envsubst < comands.sql | mysql -h localhost -u root
	if [ $? == 0 ]; then
		echo -e "\033[32mUsers and passwords successfully created\033[0m"
	else
		echo -e "\033[31mERROR: Users and passwords couldn't be created\033[0m"
		exit 1
	fi
}
else
	echo -e "\033[32mThe database was already created\033[30m"
	/usr/bin/mysqld_safe
fi
