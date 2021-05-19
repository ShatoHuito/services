FROM alpine:3.12


RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/

COPY ./srcs/grafana.db ./usr/share/grafana/data/
COPY ./srcs/init.sh ./

RUN  chmod 777 init.sh
EXPOSE	3000
CMD sh ./init.sh