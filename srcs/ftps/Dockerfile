# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add vsftpd openssl

# Nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx /www

# PhpMyAdmin install
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz && rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /www/phpmyadmin
COPY config.inc.php /www/phpmyadmin

COPY start.sh ./
CMD sh start.sh
