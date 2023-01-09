FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx

EXPOSE 80

# COPY . /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"];


# CMD echo -e "http {\n    server {\n        location /teste {\n            root /var/www;\n        }\n    }\n}\n" > /etc/nginx/nginx.conf