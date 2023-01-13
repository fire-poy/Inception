-- SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
-- -- DELETE FROM mysql.user WHERE user != 'root' OR (user = 'root' AND host != 'localhost');
-- -- DELETE FROM mysql.db WHERE db != 'mysql' OR (db = 'mysql' AND user != 'root');
-- CREATE DATABASE $MYSQL_NAME;
-- USE $MYSQL_NAME;
-- CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
-- GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost';
-- FLUSH PRIVILEGES;



-- DELETE FROM mysql.user WHERE User='';
-- DROP DATABASE test;
-- DELETE FROM mysql.db WHERE Db='test';
-- DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

/** methode d authentification normale donc : set le password **/
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');
-- SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');

/** Creation du premier user, l'autre sera cree via le container wordpress */
CREATE DATABASE $MYSQL_NAME;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_NAME.* TO $MYSQL_USER@'%';

/** Il faut flush pour que le grant soit active */
FLUSH PRIVILEGES;
