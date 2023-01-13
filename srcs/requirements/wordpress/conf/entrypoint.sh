#!/bin/sh
# sleep 10 UNCOMENT BEFORE EVAL
# add line to control if wp-config.php exist


# if [ -d /run/mysqld ] ; then
# 	echo -e "\n\033[33mThe directory /run/mysqld already exists\n\033[0m";
# fi

wp core download
# wp core install
wp config create	--allow-root \
					--dbname=$MYSQL_NAME \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=$MYSQL_HOST \
					--path='/var/www/wordpress'

#  wp config create	--allow-root --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --path='/var/www/wordpress'


# wp core install

# wp user create

sleep infinit


# add line to control if /run/php doesn't exist
if [ -d /run/php ] ; then
	mkdir /run/php
fi

# restar php
/usr/sbin/php-fpm8 -F
