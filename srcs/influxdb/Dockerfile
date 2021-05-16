# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade && apk add influxdb 

# Telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/ --allow-untrusted
RUN mkdir -p /etc/telegraf/
COPY telegraf.conf /etc/telegraf/

COPY start.sh ./

CMD sh start.sh
