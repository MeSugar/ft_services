# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add mysql mysql-client

# MySQL config
COPY ./init_mysql.sh .
COPY ./start.sh .
RUN chmod +x init_mysql.sh
# RUN sh init_mysql.sh

CMD ./start.sh
