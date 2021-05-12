FROM alpine:3.11
#обновление пакетов
RUN apk update
#установки
RUN apk add wget libc6-compat
RUN apk add influxdb
RUN apk add supervisor

#телеграф
RUN wget -c https://dl.influxdata.com/telegraf/releases/telegraf-1.18.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.18.2_linux_amd64.tar.gz && rm -rf telegraf-1.18.2_linux_amd64.tar.gz
RUN cp -r telegraf-1.18.2/* ./ && rm -rf telegraf-1.18.2

#конфигурации телеграфа
RUN telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

RUN mkdir -p /etc/influxdb
RUN mkdir -p /var/lib/influxdb

COPY ./srcs/supervisor.conf /etc/supervisor.conf

EXPOSE 8086

CMD /usr/bin/supervisord -c /etc/supervisor.conf
