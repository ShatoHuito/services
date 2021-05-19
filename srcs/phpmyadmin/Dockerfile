FROM alpine:3.12

RUN apk update
WORKDIR	/var/www/
RUN apk add nginx
RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session


RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
RUN tar xvf phpMyAdmin-5.0.2-english.tar.gz
RUN rm -rf phpMyAdmin-5.0.2-english.tar.gz
RUN mv phpMyAdmin-5.0.2-english phpmyadmin

RUN mkdir -p /run/nginx
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/config.inc.php phpmyadmin/


COPY ./srcs/init.sh ./
RUN chmod 777 init.sh
EXPOSE 5000
CMD sh ./init.sh