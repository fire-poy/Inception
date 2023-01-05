FROM alpine:3.16.3

# NEED TO ADD THE VOLUME

# installation of mariadb and mysql client
RUN apk update && \
	apk upgrade && \
	apk add --no-cache --quiet --update mariadb mysql-client mariadb-server-utils && \
	chmod 755 /var/lib/mysql && \
	rm -f /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/my.cnf

# installation of mariadb and mysql client
COPY	conf/my.cnf /etc/my.cnf.d/

# ==> Copy the bash script to create the database and the user into the container
COPY conf/start_config.sh /start_config.sh

# ==> Expose the only port allowed by the subject (MySQL)
EXPOSE 3306

# ==> Execute the bash script to create the database and the user
ENTRYPOINT ["sh", "start_config.sh"]
