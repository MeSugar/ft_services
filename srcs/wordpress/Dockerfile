# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add wget nginx openssl php7 php7-mysqli php7-fpm php7-pdo php7-gd php7-cli php7-mbstring

# Nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx /www

# Wordpress install
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN mv wordpress /www
COPY ./wp-config.php /www/wordpress

COPY ./start.sh /tmp

# Give access
RUN chmod +x /tmp/start.sh

CMD nginx -g 'daemon off;'