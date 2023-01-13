#!/bin/sh
if [ ! -d /var/lib/mysql/mysql ]; then
{
	# sleep infinit
	echo -e "\n\033[33mStart instalation mariadb\n\033[0m"
	# mysql_install_db
	# usr/bin/mysqld_safe --datadir=/var/lib/mysql &
	# mysqld_safe --skip-grant-tables #&
	# mysql_install_db --datadir=/var/lib/mysql
	if [ $? == 0 ]; then
		echo -e "\t\033[32mMaria db correctly installed\033[0m"
	else
		echo -e "\t\033[31mMaria db couldn't be installed\033[0m"
		exit 1
	fi

	mysqld_safe &
	# usr/bin/mysqld_safe --datadir=/var/lib/mysql &
	if [ $? == 0 ]; then
		echo -e "\t\033[32mmysqld_safe correctly started\033[0m"
	else
		echo -e "\t\033[31m32mmysqld_safe has a problem during ths starting process\033[0m"
		exit 1
	fi
	sleep 10

	if [ -d /run/mysqld ] ; then
		echo -e "\n\033[33mThe directory /run/mysqld already exists\n\033[0m";
	else
	{
		echo -e "\n\033[33mCreating directory /run/mysqld\n\033[0m";
		mkdir /run/mysqld
		if [ $? == 0 ]; then
			echo -e "\t\033[32mDirectory /run/mysqldMaria successfully created\033[0m"
		else
			echo -e "\t\033[31mDirectory /run/mysqldMaria couldn't be created\033[0m"
			exit 1
		fi
	}
	fi

	echo -e "\n\033[33mChanging directory /run/mysqld permissions\n\033[0m"
	chmod 777 /run/mysqld
	if [ $? == 0 ]; then
		echo -e "\t\033[32mPermissions successfully changed\033[0m"
	else
		echo -e "\t\033[31mPermissions couldn't be changed\033[0m"
		exit 1
	fi


	echo -e "\t\n\033[33mExecuting comands.sql script to create mysqld users and passwords\n\033[0m"
	envsubst < comands.sql > comands_modif.sql
	mysql -h localhost -u root < comands_modif.sql
	# rm comands_modif.sql
	# /usr/bin/mysqld_safe --user=root --bootstrap <<eof
	# SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
	# FLUSH PRIVILEGES;
	# eof

	if [ $? == 0 ]; then
		echo -e "\033[32mUsers and passwords successfully created\033[0m"
	else
		echo -e "\033[31mUsers and passwords couldn't be created\033[0m"
		exit 1
	fi
}
else
	echo "The database was already created"
fi

echo -e "\t\n\033[33mRestarting mysql\n\033[0m"
usr/bin/mysqld_safe --datadir=/var/lib/mysql
