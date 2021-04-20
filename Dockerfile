# base OS
FROM debian:buster

# upgrade and install
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

# Nginx config and copying autoindex files
COPY ./srcs/nginx.conf /tmp/nginx_configs/
COPY ./srcs/nginx_off.conf /tmp/nginx_configs/
RUN ln -s /tmp/nginx_configs/nginx.conf /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default
COPY ./srcs/autoindex_turn_off.sh ./
COPY ./srcs/autoindex_turn_on.sh ./


# MySQL config
COPY ./srcs/init_mysql.sh /tmp
RUN bash tmp/init_mysql.sh

# PhpMyAdmin install
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz && rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin

# Wordpress install
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN mv /wordpress /var/www/html/wordpress
COPY ./srcs/wp-config.php /var/www/html/wordpress

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=no/OU=no/CN=gdelta/" \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt

# Give access
RUN chown -R www-data /var/www/*
RUN chmod -R 755 /var/www/*

COPY ./srcs/start.sh ./

CMD bash start.sh
