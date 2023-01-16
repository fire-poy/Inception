#!/bin/sh
sleep 15
# add line to control if wp-config.php exist


# if [ -d /run/mysqld ] ; then
# 	echo -e "\n\033[33mThe directory /run/mysqld already exists\n\033[0m";
# fi

echo -e "\t\033[33mWP core download...\033[0m"
wp core download
if [ $? == 0 ] ; then
	echo -e "\t\033[32mWP core successfully downloaded\033[0m"
else
	echo -e "\t\033[31mWP core downloadad has failed\033[0m"
fi

echo -e "\t\033[33mWP core installing...\033[0m"
wp core install
if [ $? == 0 ] ; then
	echo -e "\t\033[32mWP core successfully installed\033[0m"
else
	echo -e "\t\033[31mWP core install has failed\033[0m"
fi

echo -e "\t\033[33mWP config create...\033[0m"
wp config create	--allow-root \
					--dbname=$MYSQL_NAME \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=$MYSQL_HOST \
					--path='/var/www/wordpress'
if [ $? == 0 ] ; then
	echo -e "\t\033[32mWP config successfully created\033[0m"
else
	echo -e "\t\033[31mWP config creation has failed\033[0m"
fi
#  wp config create	--allow-root --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --path='/var/www/wordpress'

# add line to control if /run/php doesn't exist
echo -e "\t\033[33mChecking if /run/php folder existe\033[0m"
if [ ! -d /run/php ] ; then
{
	echo -e "\t\033[33mCreating /run/php folder\033[0m"
	mkdir /run/php
	if [ $? == 0 ] ; then
		echo -e "\t\033[32m/run/php folder hsd been created\033[0m"
	else
		echo -e "\t\033[31mAn error occurred when creating the /run/php folder\033[0m"
	fi
}
else
	echo -e "\t\033[32mThe /run/php folder already exists\033[0m"
fi

echo -e "\t\033[33mInstaling theme\033[0m"
wp theme install twentysixteen --activate
if [ $? == 0 ] ; then
	echo -e "\033[32mTheme has been installed\033[0m"
else
	echo -e "\033[31mERROR while instaling theme\033[0m"
fi

# restar php
sleep 30
# echo "Restarting php"
# /usr/sbin/php-fpm8 -F
