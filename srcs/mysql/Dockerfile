# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add --no-cache mysql mysql-client && mkdir -p /run/mysqld

COPY start.sh init_db ./
COPY ./my.cnf /etc/
# COPY ./start.sh .

# RUN chmod +x start.sh

CMD sh start.sh
