FLUSH PRIVILEGES;
ALTER USER root@localhost IDENTIFIED BY 'koko';
CREATE DATABASE IF NOT EXISTS DATA_BASE_NAME;
USE DATA_BASE_NAME;
CREATE USER IF NOT EXISTS user@'%' IDENTIFIED BY 'koko';
GRANT ALL PRIVILEGES ON DATA_BASE_NAME.* TO user@'%';
CREATE USER IF NOT EXISTS USER2@'%' IDENTIFIED BY 'koko';
FLUSH PRIVILEGES;


# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
# USE $DATABASE_NAME;
# CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
# GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';
# CREATE USER IF NOT EXISTS '$SECOND_USER'@'%' IDENTIFIED BY '$SECOND_USER_PASSWORD';
# FLUSH PRIVILEGES;

-- "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

-- # create an user with a password (if the user does not exist)
-- "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

-- # give all privileges to the user
-- "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

-- #modify sql database
-- "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

-- #reload the database
-- "FLUSH PRIVILEGES;"