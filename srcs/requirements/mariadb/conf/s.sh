mysql_install_db --datadir=/var/lib/mysql
mysqld_safe &
chmod 777 /run/mysqld
envsubst < comands.sql > comands_modif.sql
mysql -h localhost -u root < comands_modif.sql
usr/bin/mysqld_safe --datadir=/var/lib/mysql
