#!/bin/sh
sleep 10

# add line to control if wp-config.php exist


# if [ -d /run/mysqld ] ; then
# 	echo -e "\n\033[33mThe directory /run/mysqld already exists\n\033[0m";
# fi

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

# wp core install

# wp user create

# add line to control if /run/php doesn't exist
if [ -d /run/php ] ; then
	mkdir /run/php
fi

# restar php
/usr/sbin/php-fpm8 -F
