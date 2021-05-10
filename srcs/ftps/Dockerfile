# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add vsftpd openssl

# create user
RUN adduser -D user && echo "user" >> /etc/vsftpd/vsftpd.userlist

# ftps config
COPY ./vsftpd.conf /etc/vsftpd/

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=no/OU=no/CN=gdelta/" \
        -keyout /etc/ssl/private/ftps-selfsigned.key \
        -out /etc/ssl/certs/ftps-selfsigned.crt

COPY start.sh ./

CMD sh start.sh
