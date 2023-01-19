FROM alpine:3.16.3

# LINE 5 - 6: Installation of mariadb and mysql client
# LINE 7: Delete default mariadb's configuration file
RUN	apk update && apk upgrade && \
	apk add mariadb=10.6.10-r0 mysql-client=10.6.10-r0 gettext=0.21-r2 && \
	rm -f /etc/my.cnf.d/mariadb-server.cnf

# Copy my mariadb's configuration file into the container
COPY	conf/my.cnf /etc/my.cnf.d/

# Copy the sql script to initialise the users and passwords into the container
COPY	conf/comands.sql /comands.sql

# Copy the shell script to start the database into the container
COPY	conf/start_config.sh /start_config.sh

RUN		chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

ENTRYPOINT	["sh", "start_config.sh"]
