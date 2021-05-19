FROM alpine:3.12
#обновление пакетов
RUN apk update

#установка
RUN apk add nginx openssl

#копирование конфига
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf

#ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=21School/CN=gbrittan" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

COPY ./srcs/init.sh /init.sh
RUN chmod 777 init.sh
RUN mkdir -p /run/nginx
EXPOSE 80 443
CMD sh ./init.sh