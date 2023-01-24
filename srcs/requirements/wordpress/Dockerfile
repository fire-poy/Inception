FROM	alpine:3.16.3

RUN		apk update && apk upgrade && \
		apk add php8 php8-fpm php8-opcache php8-gd php8-curl php8-mysqli php8-json mariadb-client php-phar php8-mbstring

RUN		mkdir /var/www && \
		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
		cd /var/www && \
		tar -xzf wordpress-6.0-fr_FR.tar.gz && \
		rm wordpress-6.0-fr_FR.tar.gz && \
		chown -R root:root /var/www/wordpress

COPY	conf/entrypoint.sh /entrypoint.sh

COPY	conf/www.conf /etc/php8/php-fpm.d

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT	["sh", "entrypoint.sh"]
