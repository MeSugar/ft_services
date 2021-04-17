# base OS
FROM alpine

# upgrade and install
RUN apk update && apk -y upgrade
RUN apk add nginx

# Nginx config and copying autoindex files
COPY ./nginx.conf /etc/nginx/

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
