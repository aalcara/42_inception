FROM debian:buster

RUN apt-get update && apt-get install -y \
	wget \
	php7.3 \
	php7.3-fpm \
# 	php7.3-opcache \
# 	php7.3-cli \
# 	php7.3-gd \
# 	php7.3-curl \
	php7.3-mysql
# 	php7.3-mbstring
	
# RUN apt-get clean && \
# 	rm -rf /var/lib/apt/lists/*

# makes directory to php-fpm runs properly
RUN mkdir -p /run/php

# based on defalut fpm config file, only changed "listen" value
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./utils /utils

EXPOSE 9000

ENTRYPOINT ["bash", "./utils/wordpress_config.sh"]

CMD ["php-fpm7.3", "-F"]