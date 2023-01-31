FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx

EXPOSE 80
EXPOSE 8080

COPY ./aalcara ./var/www/aalcara
COPY ./conf/my.conf ./etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"];


# CMD echo -e "http {\n    server {\n        location /teste {\n            root /var/www;\n        }\n    }\n}\n" > /etc/nginx/nginx.conf