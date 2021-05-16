# base OS
FROM alpine:3.12

# upgrade and install
RUN apk update && apk upgrade && apk add libc6-compat
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.6.linux-amd64.tar.gz
RUN tar -zxvf grafana-enterprise-7.5.6.linux-amd64.tar.gz
COPY dashboards.yaml /grafana-7.5.6/conf/provisioning/dashboards
COPY datasource.yaml /grafana-7.5.6/conf/provisioning/datasource


# Telegraf
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/ --allow-untrusted
RUN mkdir -p /etc/telegraf/
COPY telegraf.conf /etc/telegraf/

COPY start.sh ./

CMD sh start.sh