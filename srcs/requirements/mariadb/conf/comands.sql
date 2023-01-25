SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
-- oblige au root a mettre son mot de passe; peut donner le privileges a d'autre user
DELETE FROM mysql.user WHERE user != 'root' AND user != 'mariadb.sys' OR (user = 'root' AND host != 'localhost');
CREATE DATABASE $MYSQL_NAME;
CREATE USER '$MYSQL_USER1'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO $MYSQL_USER1@'%';
FLUSH PRIVILEGES;
