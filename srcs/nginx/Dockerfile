# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add nginx openssl

# Nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /www/
RUN mkdir -p /run/nginx

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=no/OU=no/CN=gdelta/" \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt

# Telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/ --allow-untrusted
RUN mkdir -p /etc/telegraf/
COPY telegraf.conf /etc/telegraf/

COPY start.sh .

CMD sh start.sh