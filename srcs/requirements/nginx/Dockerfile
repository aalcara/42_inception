FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx && \
	apt-get install -y openssl

EXPOSE 443

COPY ./aalcara ./var/www/aalcara
COPY ./conf/my.conf ./etc/nginx/conf.d/
COPY ./tools/ ./etc/nginx/tools

CMD ["bash", "/etc/nginx/tools/nginx.sh"];
# CMD ["nginx", "-g", "daemon off;"];
