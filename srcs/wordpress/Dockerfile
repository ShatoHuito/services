FROM alpine:3.12

RUN apk update

RUN apk add	wget nginx php-fpm php-mysqli php7-json gettext mysql-client curl php7-common php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar php7-cli php7-zip
RUN apk add php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix
RUN apk add php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

WORKDIR	/var/www
RUN mkdir -p /run/nginx
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/init.sh ./

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm -rf latest.tar.gz

RUN  chmod 777 init.sh

EXPOSE	5050

CMD sh ./init.sh