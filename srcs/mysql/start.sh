/usr/bin/mysql_install_db --datadir=/var/lib/mysql
/usr/bin/mysqld --user=root --init_file=/init_db &
sleep 10
/usr/bin/mysql wordpress -u root < /wordpress.sql
tail -f /dev/null
