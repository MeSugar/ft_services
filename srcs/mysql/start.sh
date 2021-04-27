#!/bin/sh

# mysql_install_db --user=root --datadir=/var/lib/mysql
/etc/init.d/mysql setup
/etc/init.d/mysql start

# mysql -u root
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password

tail -f /dev/null