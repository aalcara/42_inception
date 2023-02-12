FROM debian:buster

RUN apt-get update && apt-get install -y \
		wget \
		php7.3-fpm

# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar xzf latest.tar.gz
# RUN rm latest.tar.gz
# RUN mv wordpress /var/www/html/

EXPOSE 9000

# CMD ["tail", "-f", "/dev/null"]
CMD ["php-fpm7.3"]
