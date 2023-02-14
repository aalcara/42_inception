FROM debian:buster

RUN apt-get update && apt-get install -y \
		wget \
		php7.3-fpm

# makes directory to php-fpm runs properly
RUN mkdir -p /run/php

# based on defalut fpm config file, only changed "listen" value
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./utils /utils

EXPOSE 9000

CMD ["bash", "./utils/wordpress_config.sh"]
