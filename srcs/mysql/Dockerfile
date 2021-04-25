# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade
RUN apk add mysql mysql-client

COPY ./start.sh ./my.cnf ./
# COPY ./start.sh .
RUN mv my.cnf /etc/

# RUN chmod +x init_mysql.sh
# RUN sh init_mysql.sh
RUN chmod +x start.sh

CMD sh start.sh
