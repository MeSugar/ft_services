# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade && apk add vsftpd openssl

# create user
RUN adduser -D user1 && echo "user1" >> /etc/vsftpd/vsftpd.userlist && echo "user1:111" | chpasswd

# ftps config
COPY ./vsftpd.conf /etc/vsftpd/
COPY start.sh ./

# SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=no/OU=no/CN=gdelta/" \
        -keyout /etc/ssl/private/ftps-selfsigned.key \
        -out /etc/ssl/certs/ftps-selfsigned.crt

CMD sh start.sh