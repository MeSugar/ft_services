# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add mysql mysql-client && mkdir -p /run/mysqld

COPY init_db wordpress.sql ./
COPY my.cnf /etc/

# Telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/ --allow-untrusted
RUN mkdir -p /etc/telegraf/
COPY telegraf.conf /etc/telegraf/

COPY start.sh ./
RUN sed -i 's,\r,,;s, *$,,' start.sh

CMD sh start.sh
