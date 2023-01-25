#!/bin/sh
if [ ! -d /var/lib/mysql/mysql ]; then
{
	echo -e "\t\033[33m/var/lib/mysql/mysql not founded\033[0m"
	echo -e "\n\033[33mStart instalation mariadb\n\033[0m"
	# install les tables de base de données nécessaires pour un nouveau serveur MySQL
	mysql_install_db --datadir=/var/lib/mysql
	if [ $? == 0 ]; then
		echo -e "\t\033[32mMaria db correctly installed\033[0m"
	else
		echo -e "\t\033[31mERROR: Maria db couldn't be installed\033[0m"
		exit 1
	fi
	# démarrer le serveur MySQL de manière sécurisée
	mysqld_safe &
	if [ $? == 0 ]; then
		echo -e "\t\033[32mmysqld_safe correctly started\033[0m"
	else
		echo -e "\t\033[31m32mERROR: mysqld_safe has a problem during ths starting process\033[0m"
		exit 1
	fi
	sleep 5

	if [ -d /run/mysqld ] ; then
		echo -e "\n\033[33mThe directory /run/mysqld already exists\033[0m";
	else
	{
		echo -e "\n\033[33mCreating directory /run/mysqld\n\033[0m";
		mkdir /run/mysqld
		if [ $? == 0 ]; then
			echo -e "\t\033[32mDirectory /run/mysqld successfully created\033[0m"
		else
			echo -e "\t\033[31mERROR: Directory /run/mysqld couldn't be created\033[0m"
			exit 1
		fi
	}
	fi

	echo -e "\n\033[33mChanging directory /run/mysqld permissions\n\033[0m"
	chmod 777 /run/mysqld
	if [ $? == 0 ]; then
		echo -e "\t\033[32mPermissions successfully changed\033[0m"
	else
		echo -e "\t\033[31mERROR: Permissions couldn't be changed\033[0m"
		exit 1
	fi

	echo -e "\t\n\033[33mExecuting cmd.sql script to create mysqld users and passwords\n\033[0m"
	envsubst < cmd.sql | mysql -h localhost -u root
	if [ $? == 0 ]; then
		echo -e "\033[32mUsers and passwords successfully created\033[0m"
	else
		echo -e "\033[31mERROR: Users and passwords couldn't be created\033[0m"
		exit 1
	fi
}
else
	echo -e "\033[32mThe database was already created\033[30m"
	/usr/bin/mysqld_safe --datadir=/var/lib/mysql
fi
