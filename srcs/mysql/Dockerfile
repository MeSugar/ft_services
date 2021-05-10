# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add mysql mysql-client && mkdir -p /run/mysqld

COPY start.sh init_db wordpress.sql ./
COPY ./my.cnf /etc/

CMD sh start.sh
