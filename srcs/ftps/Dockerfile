FROM alpine:3.12
#обновление пакетов
RUN apk update

RUN apk add  openssl vsftpd
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=21School/CN=gbrittan" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt;
#создание логина-пароля
RUN adduser -D admin && echo "admin:admin" | chpasswd

#создание папки + права
RUN mkdir -p home/ftps/admin
RUN chmod 777 home/ftps/admin

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./srcs/init.sh ./init.sh

RUN chmod 777 init.sh
EXPOSE 21
EXPOSE 21 111

CMD sh ./init.sh