FROM debian:buster

RUN apt-get update && apt-get install -y \
		nginx \
		openssl

EXPOSE 443

COPY ./conf/my.conf ./etc/nginx/conf.d/
COPY ./tools/ ./etc/nginx/tools

ENTRYPOINT [ "bash", "/etc/nginx/tools/nginx.sh" ];

CMD [ "nginx", "-g", "daemon off;" ]
