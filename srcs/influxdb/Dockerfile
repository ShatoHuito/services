FROM alpine:3.11.7
#добавление репозитория
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update

#установки
RUN apk add wget libc6-compat
RUN apk add influxdb
RUN apk add supervisor telegraf

#телеграф.2

RUN mkdir -p /var/lib/influxdb
RUN mkdir -p /etc/influxdb

#конфигурации телеграфа
RUN mkdir /etc/telegraf/
RUN telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY ./srcs/supervisor.conf /etc/supervisor.conf

EXPOSE 8086

CMD /usr/bin/supervisord -c /etc/supervisor.conf