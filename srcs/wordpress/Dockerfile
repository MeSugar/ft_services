# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add wget nginx openssl php php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

# Nginx config
COPY ./nginx.conf /etc/nginx/
RUN mkdir -p /run/nginx

# Wordpress install
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN mv /wordpress /var/www/html/wordpress
COPY ./wp-config.php /var/www/html/wordpress

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=no/OU=no/CN=gdelta/" \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt

# Give access
RUN chown -R www-data: /var/www/html/wordpress

# COPY ./srcs/start.sh ./

CMD nginx -g 'daemon off;'