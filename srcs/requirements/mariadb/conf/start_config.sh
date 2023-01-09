#!/bin/sh
echo -e "\n\033[33mStart instalation mariadb\n\033[0m"
sleep 1
mysql_install_db
if [ $? == 0 ]; then
	echo -e "\t\033[32mMaria db correctly installed\033[0m"
else
	echo -e "\t\033[31mMaria db couldn't be installed\033[0m"
	exit 1
fi

sleep 1
echo -e "\n\033[33mCreating directory /run/mysqld\n\033[0m";
sleep 1
mkdir /run/mysqld
if [ $? == 0 ]; then
	echo -e "\t\033[32mDirectory /run/mysqldMaria successfully created\033[0m"
else
	echo -e "\t\033[31mDirectory /run/mysqldMaria couldn't be created\033[0m"
	exit 1
fi

sleep 1
echo -e "\n\033[33mChanging directory /run/mysqld permissions\n\033[0m"
sleep 1
chmod 777 /run/mysqld
if [ $? == 0 ]; then
	echo -e "\t\033[32mPermissions successfully changed\033[0m"
else
	echo -e "\t\033[31mPermissions couldn't be changed\033[0m"
	exit 1
fi

sleep 1
echo -e "\t\n\033[33mExecuting comands.sql script to create mysqld users and passwords\n\033[0m"
sleep 1
/usr/bin/mysqld --user=mysql --bootstrap < comands.sql
if [ $? == 0 ]; then
	echo -e "\033[32mUsers and passwords successfully created\033[0m"
else
	echo -e "\033[31mUsers and passwords couldn't be created\033[0m"
	exit 1
fi

echo -e "\t\n\033[33mRestarting mysql\n\033[0m"
/usr/bin/mysqld
