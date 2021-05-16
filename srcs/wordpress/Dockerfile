# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add nginx php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# Nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx /www

# Wordpress install
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN mv wordpress /www
COPY ./wp-config.php /www/wordpress

# Telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/ --allow-untrusted
RUN mkdir -p /etc/telegraf/
COPY telegraf.conf /etc/telegraf/

COPY start.sh .

CMD sh start.sh