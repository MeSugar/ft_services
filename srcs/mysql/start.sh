#!/bin/sh

# /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
# mysql -u root
# echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' WITH GRANT OPTION;"| mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password

/usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
# /etc/init.d/mariadb setup
# rc-service mariadb start

echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
# echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password
mysql wordpress -u root


tail -f /dev/null