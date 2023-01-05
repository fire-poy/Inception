#!/bin/sh
echo -e "\n\033[33mStart instalation mariadb\n\033[0m";
mysql_install_db;
if [ $? == 0 ]; then
	echo -e "\t\033[32mMaria db correctly installed\033[0m"
else
	echo -e "\t\033[31mMaria db couldn't be installed\033[0m"
	exit 1
fi

echo -e "\n\033[33mCreating directory /run/mysqld\n\033[0m";
mkdir /run/mysqld;
if [ $? == 0 ]; then
	echo -e "\t\033[32mDirectory /run/mysqldMaria successfully created\033[0m"
else
	echo -e "\t\033[31mDirectory /run/mysqldMaria couldn't be created\033[0m"
	exit 1
fi

echo -e "\n\033[33mChanging directory /run/mysqld permissions\n\033[0m";
chmod 777 /run/mysqld;
if [ $? == 0 ]; then
	echo -e "\t\033[32mPermissions successfully changed\033[0m"
else
	echo -e "\t\033[31mPermissions couldn't be changed\033[0m"
	exit 1
fi

echo -e "\t\n\033[33mCreating mysqld users and passwords\n\033[0m";
/usr/bin/mysqld --user=mysql --bootstrap << EOF
FLUSH PRIVILEGES;
ALTER USER root@localhost IDENTIFIED BY koko;
CREATE DATABASE IF NOT EXISTS DATA_BASE_NAME;
USE DATA_BASE_NAME;
CREATE USER IF NOT EXISTS user@% IDENTIFIED BY koko;
GRANT ALL PRIVILEGES ON DATA_BASE_NAME.* TO user@%;
CREATE USER IF NOT EXISTS USER2 IDENTIFIED BY koko;
FLUSH PRIVILEGES;
EOF
if [ $? == 0 ]; then
	echo -e "\033[32mUsers and passwords successfully created\033[0m"
else
	echo -e "\033[31mUsers and passwords couldn't be created\033[0m"
	exit 1
fi

echo -e "\t\n\033[33mRestarting mysql\n\033[0m";
/usr/bin/mysqld;
if [ $? == 0 ]; then
	echo -e "\033[32mMysql successfully restarted\033[0m"
else
	echo -e "\033[31mMysql couldn't be restarted\033[0m"
	exit 1
fi

# #!/bin/sh
# mysql_install_db;
# mkdir /run/mysqld;
# chmod 777 /run/mysqld;

# /usr/bin/mysqld --user=mysql --bootstrap << EOF
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
# USE $DATABASE_NAME;
# CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
# GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';
# CREATE USER IF NOT EXISTS '$SECOND_USER'@'%' IDENTIFIED BY '$SECOND_USER_PASSWORD';
# FLUSH PRIVILEGES;
# EOF

# /usr/bin/mysqld;
