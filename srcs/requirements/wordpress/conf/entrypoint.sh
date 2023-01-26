#!/bin/sh
sleep 10
if [ ! -f /var/www/wordpress/wp-config.php ] ; then
{
	echo -e "\t\033[33mWP config create...\033[0m"
	wp config create	--allow-root \
						--dbname=$MYSQL_NAME \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=$MYSQL_HOST --path='/var/www/wordpress' >> log.txt
	if [ $? == 0 ] ; then
		echo -e "\t\033[32mWP config successfully created\033[0m"
	else
		echo -e "\t\033[31mWP config creation has failed\033[0m"
	fi

	echo -e "\t\033[33mWP core installing...\033[0m"
	wp core install		--url=$DOMAIN_NAME \
						--title=$SITE_TITLE \
						--admin_user=$MYSQL_USER \
						--admin_password=$MYSQL_PASSWORD \
						--admin_email=$ADMIN_EMAIL \
						--allow-root --path='/var/www/wordpress' >> log.txt
	if [ $? == 0 ] ; then
		echo -e "\t\033[32mWP core successfully instaled\033[0m"
	else
		echo -e "\t\033[31mWP core instal has failed\033[0m"
	fi

	echo -e "\t\033[33mWP user create...\033[0m"
	wp user create		--allow-root --role=author \
						$USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS \
						--path='/var/www/wordpress' >> /log.txt
	if [ $? == 0 ] ; then
		echo -e "\t\033[32mWP user successfully created\033[0m"
	else
		echo -e "\t\033[31mWP user creation has failed\033[0m"
	fi

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

	echo -e "\t\033[33mPlugin update\033[0m"
	wp plugin update --all --path='/var/www/wordpress' >> log.txt
	if [ $? == 0 ] ; then
		echo -e "\033[32mPlugin has been updated\033[0m"
	else
		echo -e "\033[31mERROR while update plugin\033[0m"
	fi

	echo -e "\t\033[33mInstaling theme\033[0m"
	wp theme install oceanwp --activate --path='/var/www/wordpress' >> log.txt
	if [ $? == 0 ] ; then
		echo -e "\033[32mTheme has been installed\033[0m"
	else
		echo -e "\033[31mERROR while instaling theme\033[0m"
	fi
}
else
	echo -e "\033[32mWordpress has already been installed\033[0m"
fi

echo -e "\t\033[33mStarting php...\033[0m"
/usr/sbin/php-fpm8 -F
