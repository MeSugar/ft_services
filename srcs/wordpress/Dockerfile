# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add wget nginx openssl php7 php7-mysqli php7-fpm php7-pdo php7-gd php7-cli php7-mbstring

# Nginx config
COPY ./nginx.conf /etc/nginx/
RUN mkdir -p /run/nginx

# Wordpress install
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz && mkdir /www
RUN mv wordpress/* /www
COPY ./wp-config.php /www

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=no/OU=no/CN=gdelt/" \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt

COPY ./start.sh .

# Give access
RUN chmod +x start.sh

CMD ./start.sh