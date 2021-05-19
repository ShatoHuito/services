FROM alpine:3.12
#обновление пакетов
RUN apk update

#установка
RUN apk add openrc mysql mysql-client

COPY ./srcs/my.cnf ./etc/mysql/
COPY ./srcs/init.sh ./init.sh
COPY ./srcs/wordpress.sql ./

RUN chmod 777 ./init.sh
EXPOSE 3306
CMD sh ./init.sh