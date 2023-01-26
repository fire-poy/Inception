#!/bin/sh
if [ ! -d /var/lib/mysql/mysql ]; then
{
	echo -e "\n\033[33mStart instalation Mariadb\n\033[0m"
	echo -e "\n\033[33mDatabase tables needed for a new MySQL server\n\033[0m"
	#par default my.cnf datadir = /var/lib/mysql
	mysql_install_db
	if [ $? == 0 ]; then
		echo -e "\t\033[32mMariadb correctly installed\033[0m"
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
	sleep 2
	#temps pour initialiser mysqld_safe et pouvoir faire mysql -h localhost -u root
	echo -e "\t\n\033[33mExecuting cmd.sql script to create mysqld users, passwords and database\n\033[0m"
	envsubst < cmd.sql | mysql -h localhost -u root
}
else
	echo -e "\033[32mThe database was already created\033[30m"
	mysqld_safe
fi