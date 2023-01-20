FROM alpine:3.16.3

# MAY BE NEED TO ADD THE VOLUME MAY BE OR JUST DOIT AT THE DOCKER COMPOSE FILE

# Installation of mariadb and mysql client
RUN	apk update && apk upgrade && \
	apk add mariadb mysql-client gettext
	# apk add mysql mysql-client gettext
	# envsubst viene en gettext (startconfig)

	# chmod 755 /var/lib/mysql TO CHECK

# Delete default mariadb's configuration file
RUN	rm -f /etc/my.cnf.d/mariadb-server.cnf

# Copy my mariadb's configuration file into the container
COPY	conf/my.cnf /etc/my.cnf.d/
RUN		chmod 644 /etc/my.cnf.d/my.cnf

# Copy the sql script to initialise the users and passwords into the container
COPY	conf/comands.sql /comands.sql

# Copy the shell script to start the database into the container
COPY	conf/start_config.sh /start_config.sh

#user mysql grupo mysql
RUN		chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

ENTRYPOINT	["sh", "start_config.sh"]


