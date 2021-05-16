# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add nginx php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# Nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx /www

# PhpMyAdmin install
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-all-languages.tar.gz && rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /www/phpmyadmin
COPY config.inc.php /www/phpmyadmin

# Telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/ --allow-untrusted
RUN mkdir -p /etc/telegraf/
COPY telegraf.conf /etc/telegraf/

COPY start.sh .

CMD sh start.sh
